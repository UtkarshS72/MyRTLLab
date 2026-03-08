# Pipelined MAC Unit

A simple multiply-accumulate unit, built as an exercise in pipelining.

## Design Decisions

The pipeline has two stages: multiplication and addition.

**Valid signal:** A `valid` input propagates through the pipeline as a shift register, arriving at the output in lockstep with the data it describes. This allows downstream modules to distinguish real results from the garbage values present during pipeline startup.

**Pipeline register:** The multiply result is stored in an intermediate register between stages. On the next clock edge this feeds into the addition stage.

**Input alignment:** Both the `valid` signal and the `c` input are buffered by one cycle so they arrive at the addition stage at the same time as the `a` and `b` values they entered with.

## Synthesis Results (Artix-7 xc7a35tcpg236-1)

| Metric | Value |
|--------|-------|
| Fmax | 264 MHz |
| LUTs | 86 (0.41%) |
| DSPs | 0 |

No DSP blocks were inferred — the 8-bit multiplicand width is small enough that LUT-based implementation is sufficient. Wider operands would typically trigger DSP48 inference.

## Simulation

<img width="1512" height="789" alt="image" src="https://github.com/user-attachments/assets/949ec4c8-c8b4-4ea0-b59a-b32ee7bafb02" />
