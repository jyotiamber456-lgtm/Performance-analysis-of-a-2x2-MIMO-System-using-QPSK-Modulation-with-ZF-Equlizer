# Design and Performance Analysis of a 2×2 MIMO System Using QPSK and ZF Equalization
<p align="justify">
This project implements and analyzes a <b>2×2 MIMO wireless communication system </b> using <b>QPSK modulation</b> and a <b>Zero-Forcing (ZF) equalizer</b> in MATLAB. Random binary data is mapped to normalized Gray-coded QPSK symbols and transmitted through an independent Rayleigh fading MIMO channel with AWGN. At the receiver, ZF equalization is applied to separate the spatial streams, followed by QPSK symbol detection and bit demapping. The system performance is evaluated using Bit Error Rate (BER) versus E<sub>b</sub>/N<sub>0</sub> over the range of 0–35 dB using Monte Carlo simulation </p>

<h2>🎯 Objectives</h2>

**The main objectives of this project are to:**

* Implement a **2×2 MIMO wireless communication system** using MATLAB.
* Apply **QPSK modulation** with Gray mapping for data transmission.
* Model the wireless channel using independent **Rayleigh fading** and **AWGN**.
* Implement a Zero-Forcing (ZF) equalizer to recover the transmitted spatial streams.
* Perform QPSK symbol detection and bit demapping at the receiver.
* Evaluate system performance by calculating Bit Error Rate (BER) for different **E<sub>b</sub> / N<sub>0</sub>** values.
* Analyze the overall BER versus **E<sub>b</sub> / N<sub>0</sub>** performance of the simulated 2×2 MIMO system.
## ⚙️ System Configuration

| Category | Parameter | Symbol / Setting | Value | Description |
|:---|:---|:---:|:---:|:---|
| **MIMO** | Transmit Antennas | $N_t$ | 2 | Number of transmitting antennas |
| **MIMO** | Receive Antennas | $N_r$ | 2 | Number of receiving antennas |
| **Modulation** | Modulation Scheme | — | QPSK | Quadrature Phase Shift Keying |
| **Modulation** | Modulation Order | $M$ | 4 | Four-point QPSK constellation |
| **Modulation** | Bits per Symbol | $k$ | 2 | $\log_2(M)$ bits per symbol |
| **Channel** | Channel Model | — | Rayleigh Fading | Independent complex fading coefficients |
| **Channel** | Channel Matrix | $\mathbf{H}$ | $2 \times 2$ | MIMO channel for each transmitted symbol |
| **Noise** | Noise Model | — | AWGN | Complex additive white Gaussian noise |
| **Equalization** | Equalizer | — | ZF | Zero-Forcing linear equalization |
| **Simulation** | Bits per Packet | — | 100,000 | Number of generated information bits |
| **Simulation** | Number of Packets | — | 100 | Packets simulated for each $E_b/N_0$ |
| **Simulation** | Random Seed | — | 1 | Ensures reproducible random sequences |
| **SNR** | $E_b/N_0$ Range | — | 0–35 dB | Range of simulated energy-per-bit to noise-density ratios |
| **SNR** | $E_b/N_0$ Step | — | 5 dB | Increment between simulation points |
| **Detection** | Symbol Detection | — | Minimum Euclidean Distance | Selects the nearest QPSK constellation point |
| **Performance** | Evaluation Metric | — | BER | Bit Error Rate |
## 📐 System Model

The considered system consists of a **2 × 2 MIMO wireless communication system**, where two transmit antennas simultaneously transmit QPSK-modulated symbols through an independent Rayleigh fading channel to two receive antennas. Additive white Gaussian noise (AWGN) is added at the receiver to model the effect of channel noise.

The received signal is represented as:

$$
\mathbf{y} = \mathbf{H}\mathbf{x} + \mathbf{w}
$$

where:

- $\mathbf{y}$ represents the received signal vector.
- $\mathbf{x}$ represents the transmitted QPSK symbol vector.
- $\mathbf{H}$ represents the $2 \times 2$ MIMO channel matrix.
- $\mathbf{w}$ represents the complex AWGN vector.

The MIMO channel matrix is given by:

$$
\mathbf{H} =
\begin{bmatrix}
h_{11} & h_{12} \\
h_{21} & h_{22}
\end{bmatrix}
$$

where each channel coefficient is generated according to an independent complex Gaussian distribution, representing Rayleigh fading.

At the receiver, a **Zero-Forcing (ZF) equalizer** is applied to separate the transmitted spatial streams. The ZF equalizer is given by:

$$
\mathbf{W}_{ZF} =
(\mathbf{H}^{H}\mathbf{H})^{-1}\mathbf{H}^{H}
$$

and the estimated transmitted signal is obtained as:

$$
\hat{\mathbf{x}} = \mathbf{W}_{ZF}\mathbf{y}
$$

The recovered symbols are then detected using minimum Euclidean distance from the QPSK constellation, followed by bit demapping. The system performance is finally evaluated in terms of **Bit Error Rate (BER)** for different values of $E_b/N_0$.
![System model](https://github.com/jyotiamber456-lgtm/Performance-analysis-of-a-2x2-MIMO-System-using-QPSK-Modulation-with-ZF-Equlizer/blob/main/System%20Model.png)
## 🔄 Simulation Workflow

The simulation follows a sequential digital communication process, starting from random binary data generation and ending with BER evaluation. The complete workflow is:

```
Random Binary Data
        ↓
   QPSK Mapping
        ↓
  2×2 MIMO Streams
        ↓
Rayleigh Fading Channel
        ↓
      AWGN
        ↓
 Received Signal
        ↓
 ZF Equalization
        ↓
 QPSK Symbol Detection
        ↓
    Bit Demapping
        ↓
   Error Counting
        ↓
      BER
        ↓
 BER vs Eb/N0
```
## 📊 Results

The simulated BER performance of the 2×2 MIMO system is presented in the figure below.

![BER Performance](https://github.com/jyotiamber456-lgtm/Performance-analysis-of-a-2x2-MIMO-System-using-QPSK-Modulation-with-ZF-Equlizer/blob/main/Screenshot%202026-08-13%20193735.png)
## ▶️ How to Run

1. Clone or download this repository.
2. Open the project in MATLAB.
3. Navigate to the `code` folder.
4. Open `Mimo.m`.
5. Run the script.
6. The BER results and performance plot will be generated automatically.
## 🎓 Conclusion
<p align="justify">
This project successfully implements a 2×2 MIMO wireless communication system using QPSK modulation and Zero-Forcing (ZF) equalization in MATLAB. The system is simulated over an independent Rayleigh fading channel with AWGN, and its performance is evaluated using BER for different E<sub>b</sub>/N<sub>0</sub> values. The project provides a practical understanding of MIMO transmission, QPSK modulation, channel fading, ZF-based signal recovery, and BER performance analysis.</p>

## 👤 Author

**Amber Jyoti**

**Tools & Technologies:** MATLAB | QPSK | MIMO | Rayleigh Fading | ZF Equalization
