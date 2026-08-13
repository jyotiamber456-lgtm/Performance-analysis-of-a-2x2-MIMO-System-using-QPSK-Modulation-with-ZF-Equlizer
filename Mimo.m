% MIMO BER vs SNR (2x2), QPSK, ZF (Optimized)

clear; clc;

Nt = 2;           % transmit antennas
Nr = 2;           % receive antennas
M = 4;            % QPSK
k = log2(M);

rng(1); % random seed fix

numBitsPerPkt = 1e5;
numPkts = 100;        % reduced slightly for speed
EbNo_dB = 0:5:35;

ber = zeros(size(EbNo_dB));

% QPSK Gray mapping
symMap = (1/sqrt(2)) * [1+1j, -1+1j, -1-1j, 1-1j];

% Precompute bit patterns+
bitPatterns = de2bi(0:M-1, k, 'left-msb');

for idx = 1:length(EbNo_dB)

    EbNo = EbNo_dB(idx);
    N0 = 10^(-EbNo/10);
    noiseVar = N0/(2*k);

    bitErrors = 0;
    bitsTotal = 0;

    for pkt = 1:numPkts

        %% --- Transmitter ---
        bits = randi([0 1], numBitsPerPkt, 1);

        % Correct padding
        Lsym = ceil(numBitsPerPkt/(k*Nt));
        bitsPad = [bits; randi([0 1], Lsym*k*Nt - numBitsPerPkt, 1)];

        bitsResh = reshape(bitsPad, k, []).';
        idxSym = bi2de(bitsResh,'left-msb') + 1;

        sAll = symMap(idxSym).';
        sAll = reshape(sAll, Nt, []);   % Nt x Ns
        Ns = size(sAll,2);

        %% --- Channel (vectorized) ---
        H = (randn(Nr,Nt,Ns) + 1j*randn(Nr,Nt,Ns))/sqrt(2);
        w = sqrt(noiseVar)*(randn(Nr,Ns) + 1j*randn(Nr,Ns));

        %% --- Received signal ---
        y = zeros(Nr,Ns);
        for n = 1:Ns
            y(:,n) = H(:,:,n)*sAll(:,n);
        end
        y = y + w;

        %% --- ZF Equalization (no pinv) ---
        xHat = zeros(Nt,Ns);
        for n = 1:Ns
            Hn = H(:,:,n);
            xHat(:,n) = (Hn' * Hn) \ (Hn' * y(:,n));
        end

        %% --- Detection (vectorized) ---
        % Distance to constellation points
        dists = abs(xHat(:) - symMap).^2;
        [~, idxHat] = min(dists, [], 2);

        %% --- Bit Demapping ---
        rxBitsMat = bitPatterns(idxHat, :);
        rxBits = reshape(rxBitsMat.', [], 1);

        txBits = bitsPad;

        %% --- Error counting ---
        bitErrors = bitErrors + sum(rxBits ~= txBits(1:length(rxBits)));
        bitsTotal = bitsTotal + length(rxBits);

    end

    ber(idx) = bitErrors / bitsTotal;
    fprintf('EbNo = %2d dB, BER = %g\n', EbNo, ber(idx));

end

%% --- Plot ---
figure;
semilogy(EbNo_dB, ber, '-o','LineWidth',1.5);
grid on;
xlabel('Eb/No (dB)');
ylabel('BER');
title('2x2 MIMO ZF Detection (QPSK)');