# 🥤 Vending Machine Simulation in Verilog (Vivado)

## 🔍 Project Overview  
This project implements a **Vending Machine** using **Verilog HDL**, simulated in **Xilinx Vivado**.  
The machine accepts coins of ₹1, ₹5, and ₹10, and allows users to select one of three available products. Once enough balance is inserted, the selected product is dispensed, and any remaining balance is returned as **change**.

The project demonstrates the practical use of **Finite State Machines (FSM)** and **sequential logic design** in digital systems.

---

## ⚙️ Key Features  
- Accepts ₹1, ₹5, and ₹10 coins as inputs.  
- Supports **three selectable products** with customizable prices.  
- Automatically **dispenses the product** once the inserted amount ≥ product price.  
- Calculates and returns **remaining change**.  
- Designed and simulated using **Vivado**.  
- Simple and modular FSM-based design (with `IDLE`, `WAIT_COIN`, and `DISPENSE` states).

---

## 🧩 Module Description  

### 🧠 FSM States
| State | Description |
|--------|--------------|
| **IDLE** | Waits for product selection. Initializes all values. |
| **WAIT_COIN** | Accepts coin inputs and accumulates total amount. |
| **DISPENSE** | Dispenses the product and returns change, then resets to IDLE. |

---

## 💻 Verilog Module Overview  

### Module: `vending_machine_vivado`

| Signal | Direction | Description |
|---------|------------|-------------|
| `clk` | Input | System clock |
| `rst` | Input | Active-high reset |
| `coin1`, `coin5`, `coin10` | Input | Coin inputs (₹1, ₹5, ₹10) |
| `sel_product0`, `sel_product1`, `sel_product2` | Input | Product selection inputs |
| `dispense` | Output | High when product is dispensed |
| `change` | Output [7:0] | Shows remaining change after purchase |

---

## 🧮 Product Pricing  

| Product | Signal | Price (₹) |
|----------|----------|-----------|
| Product 0 | `sel_product0` | 10 |
| Product 1 | `sel_product1` | 15 |
| Product 2 | `sel_product2` | 20 |

---

## 🧪 Simulation Steps  

1. Open **Vivado** and create a new Verilog project.  
2. Add the following files:  
   - `vending_machine.v` (Design file)  
   - `tb_vending_machine.v` (Testbench file)  
3. Run the **Behavioral Simulation**.  
4. Observe the waveform for:  
   - Coin insertions  
   - State transitions  
   - Product dispense signal (`dispense`)  
   - Change output (`change`)  

---

## 🧠 Working Example  

| Sequence | Action | Result |
|-----------|---------|--------|
| Select Product 1 (₹15) | — | Waiting for coins |
| Insert ₹10 | — | Amount = 10 |
| Insert ₹5 | — | Total = 15 → Dispense Product |
| Output | — | `dispense = 1`, `change = 0` |

---


## 📂 Output

<img width="1920" height="1080" alt="Screenshot 2025-10-10 185409" src="https://github.com/user-attachments/assets/4f75c290-5c68-4eb6-908f-1cd11964fc16" />

<img width="1910" height="1039" alt="Screenshot 2025-10-10 185309" src="https://github.com/user-attachments/assets/4c604e17-73c1-42e8-b660-534cf191414a" />




