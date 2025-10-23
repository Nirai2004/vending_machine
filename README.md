###🧩 Module Description
##🧠 FSM States
State	Description
IDLE	Waits for product selection. Initializes all values.
WAIT_COIN	Accepts coin inputs and accumulates total amount.
DISPENSE	Dispenses the product and returns change, then resets to IDLE.

##💻 Verilog Module Overview
Module: vending_machine_vivado
Signal	Direction	Description
clk	Input	System clock
rst	Input	Active-high reset
coin1, coin5, coin10	Input	Coin inputs (₹1, ₹5, ₹10)
sel_product0, sel_product1, sel_product2	Input	Product selection inputs
dispense	Output	High when product is dispensed
change	Output [7:0]	Shows remaining change after purchase

##🧮 Product Pricing
Product	Signal	Price (₹)
Product 0	sel_product0	10
Product 1	sel_product1	15
Product 2	sel_product2	20
##🧪 Simulation Steps

Open Vivado and create a new Verilog project.

Add the following files:

vending_machine.v (Design file)

tb_vending_machine.v (Testbench file)

Run the Behavioral Simulation.

Observe the waveform for:

Coin insertions

State transitions

Product dispense signal (dispense)

Change output (change)
<img width="1920" height="1080" alt="Screenshot 2025-10-10 185409" src="https://github.com/user-attachments/assets/540638db-7b39-407f-8e4f-28d1e0b53ff0" />
<img width="1910" height="1039" alt="Screenshot 2025-10-10 185309" src="https://github.com/user-attachments/assets/5aa591ce-51e8-4fa8-9b27-5413205eb624" />



##🧠 Working Example
Sequence	Action	Result
Select Product 1 (₹15)	—	Waiting for coins
Insert ₹10	—	Amount = 10
Insert ₹5	—	Total = 15 → Dispense Product
Output	—	dispense = 1, change = 0


##🚀 Future Enhancements

Add refund and cancel selection functionality.

Display balance and price using a 7-segment or LCD module.

Extend the design for FPGA implementation on Basys 3 or Nexys A7 boards.

##👨‍💻 Author

Nirai Mathiyan
B.E. in Electronics and Communication Engineering
Developed as part of a Digital System Design / VLSI lab project using Verilog HDL and Vivado.

##🧾 License

This project is open-source and available under the MIT License
.
