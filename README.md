# 4-bit Synchronous Up/Down Counter — Verilog HDL

## Overview
A 4-bit synchronous counter with **Up/Down** mode, **Enable**, **Reset**, and overflow flags. Counts from 0–15 (up) or 15–0 (down) on every positive clock edge.

## Port Description
| Port | Dir | Width | Description |
|------|-----|-------|-------------|
| clk | in | 1 | Clock input |
| rst | in | 1 | Synchronous reset (active HIGH) |
| enable | in | 1 | Count enable |
| up_down | in | 1 | 1=UP, 0=DOWN |
| count | out | 4 | Current count value |
| max_reached | out | 1 | HIGH at count=15 in UP mode |
| min_reached | out | 1 | HIGH at count=0 in DOWN mode |

## Expected Simulation Output
```
--- Counting UP (0 to 15) ---
Count | Max | Min
  00  |  0  |  0
  01  |  0  |  0
  ...
  14  |  0  |  0
  15  |  1  |  0   ← Max reached flag HIGH

--- Counting DOWN (15 to 0) ---
Count | Max | Min
  15  |  0  |  0
  14  |  0  |  0
  ...
  01  |  0  |  0
  00  |  0  |  1   ← Min reached flag HIGH
```

## Files
| File | Description |
|------|-------------|
| `counter_4bit.v` | RTL Design |
| `counter_4bit_tb.v` | Testbench |

## How to Run

### EDA Playground
1. [https://www.edaplayground.com](https://www.edaplayground.com)
2. Simulator: **Icarus Verilog 0.9.7**
3. Paste files → Click **Run**

## Author
**Yashganesh Bachhav** | B.E. EnTC | LGNSCOE Nashik  
VLSI Internship — CODTECH IT Solutions (Jan–Feb 2025)
