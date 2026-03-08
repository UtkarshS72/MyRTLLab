# Pipelined MAC Unit

A simple multiply-accumulate unit, built as an exercise in pipelining.

## Design Decisions

The pipeline has two stages: multiplication and addition.

**Valid signal:** The `valid` signal is delayed by one cycle so it remains aligned with the pipelined data path. This allows downstream modules to distinguish real results from the garbage values present during pipeline startup. 

**Pipeline register:** The multiply result is stored in an intermediate register between stages. On the next clock edge this feeds into the addition stage.

**Input alignment:** Both the `valid` signal and the `c` input are buffered by one cycle so they arrive at the addition stage at the same time as the `a` and `b` values they entered with.

## Synthesis Results (Artix-7 xc7a35tcpg236-1)

| Metric           |      Value |
| ---------------- | ---------: |
| Clock constraint |    100 MHz |
| WNS              |   6.209 ns |
| Estimated Fmax   |   ~264 MHz |
| LUTs             | 86 (0.41%) |
| DSPs             |          0 |


Timing met comfortably at 100 MHz. No DSP blocks were inferred; for this small 8×8 multiply, LUT-based implementation was sufficient. Wider operands would more likely map to DSP48 blocks.

## Simulation

<img width="1512" height="789" alt="image" src="https://github.com/user-attachments/assets/949ec4c8-c8b4-4ea0-b59a-b32ee7bafb02" />
