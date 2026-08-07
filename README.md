# VGA Controller with Frame Buffer using SRAM in Verilog

## Overview

This project implements a **VGA display controller** using Verilog HDL. The design generates standard VGA synchronization signals and displays pixel data retrieved from a frame buffer implemented using SRAM.

The controller produces a **640 × 480 @ 60 Hz VGA output**, where each visible pixel is read from memory and converted into RGB signals. A PLL module generates the required pixel clock from the system clock.

---

## Features

* VGA Timing Generator
* 640 × 480 Resolution
* 60 Hz Refresh Rate
* Frame Buffer Using SRAM
* 8-bit Pixel Storage
* RGB Video Output
* PLL-Based Pixel Clock Generation
* FPGA Ready Design
* Simulation Support

---

## Project Structure

```text
VGA_Project/
│
├── vga.v
├── Simple_pattern.v
├── sram.v
├── PLL_25MHz.v
├── clk_wiz_0_clk_wiz.v
├── tb_vga.v
└── README.md
```

---

## System Architecture

```text
           System Clock
                 │
                 ▼
          PLL / Clock Divider
                 │
          25 MHz Pixel Clock
                 │
                 ▼
      +----------------------+
      | VGA Timing Generator |
      +----------+-----------+
                 │
        Pixel Address Generation
                 │
                 ▼
             Frame Buffer
               (SRAM)
                 │
           Pixel Data (8-bit)
                 │
                 ▼
           RGB Video Output
```

---

## Module Description

### vga.v

Top-level module that integrates the PLL and VGA timing generator.

Responsibilities:

* Generate the pixel clock
* Connect VGA timing logic
* Drive VGA output signals

---

### Simple_pattern.v

Implements VGA timing and frame buffer addressing.

Responsibilities:

* Horizontal pixel counter
* Vertical line counter
* HSYNC generation
* VSYNC generation
* Visible area detection
* Pixel address generation
* RGB signal generation

---

### sram.v

Implements the frame buffer memory.

Responsibilities:

* Store pixel values
* Provide pixel data to the VGA controller
* Support synchronous memory access

---

### PLL_25MHz.v

Generates the required 25 MHz pixel clock from the input system clock.

---

## VGA Timing

| Parameter         |     Value |
| ----------------- | --------: |
| Resolution        | 640 × 480 |
| Refresh Rate      |     60 Hz |
| Pixel Clock       |    25 MHz |
| Horizontal Pixels |       800 |
| Vertical Lines    |       525 |

---

## Display Operation

1. Generate the 25 MHz pixel clock.
2. Increment horizontal and vertical counters.
3. Determine whether the current position is inside the visible display area.
4. Generate the corresponding frame buffer address.
5. Read pixel data from SRAM.
6. Drive RGB outputs.
7. Generate HSYNC and VSYNC signals.

---

## Simulation

The supplied testbench verifies:

* Clock generation
* HSYNC generation
* VSYNC generation
* RGB output activity
* Continuous VGA timing operation

---

## How to Simulate

### ModelSim / QuestaSim

```text
vlog sram.v
vlog PLL_25MHz.v
vlog Simple_pattern.v
vlog vga.v
vlog tb_vga.v

vsim tb_vga

add wave *

run -all
```

### Icarus Verilog

```text
iverilog -o vga_sim \
sram.v \
PLL_25MHz.v \
Simple_pattern.v \
vga.v \
tb_vga.v

vvp vga_sim
gtkwave dump.vcd
```

---

## Applications

* FPGA graphics systems
* VGA monitor interfacing
* Image display
* Frame buffer implementation
* Embedded graphics
* Digital system laboratories

---

## Tools Used

* Verilog HDL
* ModelSim / QuestaSim
* Icarus Verilog
* GTKWave
* FPGA Development Board

---

## Learning Outcomes

This project demonstrates:

* VGA timing generation
* Horizontal and vertical synchronization
* Frame buffer implementation
* SRAM integration
* Pixel addressing
* RGB video generation
* RTL design using Verilog
* Functional verification through simulation

---

## Future Improvements

* Support higher VGA resolutions
* Full 8-bit RGB color output
* Image loading from external memory
* Sprite rendering
* Double buffering
* Hardware text display
* HDMI output support
* Configurable display resolutions

---

## License

This project is intended for educational purposes and digital design learning.
