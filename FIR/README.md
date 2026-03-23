# 4-Tap Pipelined FIR Filter

A simple 4-tap streaming FIR filter intended as an RTL warm-up for later convolution-engine work.

## Filter

The implemented filter is:

y[n] = x[n] + 2x[n-1] + 2x[n-2] + x[n-3]

## Architecture

The datapath is organized into 4 registered stages:

1. shift / delay-line update  
2. product stage  
3. first adder-tree level  
4. final adder-tree level

## Design Decisions

**Valid propagation:**  
`valid_in` is propagated through stage-valid registers (`valid_shift`, `valid_product`, `valid_sum`) so that `valid_y` aligns with the final registered output. These valid signals gate the corresponding pipeline stages and allow downstream modules to distinguish meaningful outputs from invalid pipeline values.

**Adder tree:**  
An adder tree was used instead of serial accumulation. This reduces the addition depth from O(N) to O(log N), which improves timing and scales better to larger filters (e.g., multi-tap FIR or 3×3 convolution).

## Verification

The design was verified in simulation with:

- impulse input
- increasing input sequence
- bubble insertion in `valid_in`

These checks confirmed:
- correct impulse response
- correct pipelined output values
- correct bubble propagation through the valid pipeline

## Synthesis Results (Artix-7 xc7a35tcpg236-1)

| Metric           |      Value |
|------------------|-----------:|
| Clock constraint |    100 MHz |
| WNS              |   7.381 ns |
| Estimated Fmax   |   ~378 MHz |
| LUTs             | 25 (0.12%) |
| FFs              | 99 (0.24%) |
| DSPs             |          0 |

## Simulation

<img width="906" height="512" alt="image" src="https://github.com/user-attachments/assets/bbf34811-740f-4dfd-8ce6-0a4c0974346d" />
