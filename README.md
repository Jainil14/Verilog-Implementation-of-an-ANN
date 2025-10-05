# Verilog-Implementation-of-an-ANN


![Verilog](https://img.shields.io/badge/Language-Verilog-blue.svg)
![FPGA](https://img.shields.io/badge/FPGA-Cyclone%20II-green.svg)
![Tool](https://img.shields.io/badge/Tool-Quartus%20II-lightgrey.svg)

This repository contains the Verilog implementation of a simple Artificial Neural Network (ANN) on an Intel/Altera Cyclone II FPGA. The project demonstrates a hardware-accelerated approach to neural network processing, focusing on simplicity and efficiency for rapid, low-power processing.

---

## 🧠 Network Architecture

The ANN is structured with three layers: an **input layer**, a **hidden layer**, and an **output layer**. This architecture is designed for basic pattern recognition tasks.

* **Input Layer**: Takes six 3-bit signed inputs (`i1` to `i6`).
* **Hidden Layer**: Contains two neurons that process the outputs from the input layer.
* **Output Layer**: A single neuron that generates the final 8-bit result.

The **ReLU (Rectified Linear Unit)** function is used as the activation function at each layer. This simplifies computations by converting any negative value to zero, which is highly efficient for hardware implementation.

<p align="center">
  <img src="img/structure_neural_network.jpg" alt="Network Diagram" width="700"/>
  <br>
  <em>Figure: Block Diagram of the Neural Network Structure</em>
</p>

---

## 💻 Hardware & Software

### Hardware
* **FPGA Board**: Altera Cyclone II.
* **Inputs**: 18 physical switches are used to provide the six 3-bit signed inputs.
* **Outputs**: 8 onboard LEDs are used to display the final 8-bit binary output.

### Software
* **HDL**: The design is written in **Verilog HDL**.
* **Synthesis & Implementation**: **Intel Quartus II** was used to compile, synthesize, and program the design onto the FPGA.
* **Simulation**: **ModelSim** was used for functional verification of the Verilog code before hardware deployment.

---

## 🛠️ Implementation Details

### Inputs and Outputs
* The network processes six parallel inputs, each being a **3-bit signed value** (limited to -1, 0, and 1).
* The final output is an **8-bit unsigned binary value** displayed on the LEDs.

### Weights and Biases
For simplicity and resource efficiency, all weights (`w1` to `w9`) and biases (`b1` to `b6`) are **pre-defined and hardcoded directly into the Verilog module**. This avoids the need for complex on-chip training logic or external memory for storing parameters. The values are initialized in an `initial` block within the Verilog code.

---

## 📊 Results

This section showcases the post-synthesis results from the Quartus II software.

### RTL Viewer
The Register-Transfer Level (RTL) schematic below illustrates the hardware structure synthesized from the Verilog code, showing the interconnection of registers, adders, and multipliers.

<p align="center">
  <img src="img/rtl_view.png" alt="RTL Viewer" width="800"/>
</p>

### FPGA Resource Utilization
The following is a summary of the logic elements and registers used on the Cyclone II FPGA. This design is lightweight, demonstrating the efficiency of implementing simple neural networks on hardware.

<p align="center">
  <img src="img/utilization_report.png" alt="FPGA Resource Utilization" width="600"/>
</p>
