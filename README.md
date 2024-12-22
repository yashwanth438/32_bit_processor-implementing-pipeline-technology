# 32_bit_processor-implementing-pipeline-technology
# MIPS32 Pipeline Simulator

This repository contains a Verilog-based implementation of a 5-stage pipelined MIPS32 processor. The processor supports various arithmetic, logical, and memory operations, along with branching and halting functionality. A testbench is included to verify the functionality of the design.

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Pipeline Stages](#pipeline-stages)
- [Instruction Set](#instruction-set)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Output Example](#output-example)
- [License](#license)

## Introduction
The MIPS32 Pipeline Simulator models a basic 5-stage pipelined processor, implementing the following stages:
1. **Instruction Fetch (IF)**
2. **Instruction Decode (ID)**
3. **Execution (EX)**
4. **Memory Access (MEM)**
5. **Write Back (WB)**

The processor is implemented in Verilog, and a testbench is provided to simulate and observe the behavior of the pipeline.

## Features
- 32 general-purpose registers (32-bit each).
- 1024 memory locations (32-bit each).
- Support for R-type, I-type, and branching instructions.
- Hazard detection for branch instructions.
- Two-phase clock simulation.
- Implements basic ALU operations (ADD, SUB, AND, OR, SLT, MUL).
- Load and store instructions.
- HALT instruction to stop the processor.

## Pipeline Stages
1. **Instruction Fetch (IF)**: Fetches instructions from memory and updates the Program Counter (PC).
2. **Instruction Decode (ID)**: Decodes the instruction, reads register values, and calculates immediate values.
3. **Execution (EX)**: Performs arithmetic and logical operations, calculates memory addresses, and evaluates branch conditions.
4. **Memory Access (MEM)**: Reads or writes data to memory based on the instruction type.
5. **Write Back (WB)**: Writes results back to the appropriate register.

## Instruction Set
### Supported Instructions
| Opcode    | Instruction | Description                     |
|-----------|-------------|---------------------------------|
| `000000`  | ADD         | Add two registers (R-type)     |
| `000001`  | SUB         | Subtract two registers          |
| `000010`  | AND         | Logical AND of two registers    |
| `000011`  | OR          | Logical OR of two registers     |
| `000100`  | SLT         | Set on less than                |
| `000101`  | MUL         | Multiply two registers          |
| `001000`  | LW          | Load word from memory (I-type)  |
| `001001`  | SW          | Store word to memory (I-type)   |
| `001010`  | ADDI        | Add immediate to register       |
| `001011`  | SUBI        | Subtract immediate              |
| `001100`  | SLTI        | Set on less than immediate      |
| `001101`  | BNEQZ       | Branch if not equal to zero     |
| `001110`  | BEQZ        | Branch if equal to zero         |
| `111111`  | HLT         | Halt the processor              |

## Getting Started
### Prerequisites
- Verilog simulator (e.g., ModelSim, Xilinx Vivado, Icarus Verilog)
- Basic understanding of MIPS architecture and pipelining

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/<your-username>/mips32-pipeline.git
   ```
2. Navigate to the project directory:
   ```bash
   cd mips32-pipeline
   ```
3. Run the simulation using your preferred Verilog simulator.

## Usage
1. Modify the memory content and instructions in the `tb_MIPS32` module as needed.
2. Run the simulation and observe the output.
3. Register values and other outputs will be displayed in the simulation log.

### Example Memory Initialization
```verilog
uut.Mem[0] = 32'h2801000a; // ADDI R1, R0, 10
uut.Mem[1] = 32'h28020014; // ADDI R2, R0, 20
uut.Mem[2] = 32'h28030019; // ADDI R3, R0, 25
uut.Mem[5] = 32'h00222000; // ADD R4, R1, R2
uut.Mem[7] = 32'h00832800; // ADD R5, R4, R3
uut.Mem[8] = 32'hfc000000; // HLT
```

## Project Structure
```
.
├── mips32_pipeline.v       # Main processor module
├── tb_MIPS32.v             # Testbench module
├── README.md               # Project documentation
└── LICENSE                 # License file (optional)
```

## Output Example
After running the simulation, you should see register values displayed:
```
R0 -  0
R1 - 10
R2 - 20
R3 - 25
R4 - 30
R5 - 55
```
This output corresponds to the execution of the provided instructions.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

