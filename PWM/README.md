# PWM Module

A simple PWM module written in Verilog.

## Design Decisions

The input `clk` is the reference for time. 100 ticks of `clk` represent one period, giving 1% duty cycle resolution. This can be increased for finer control.

The PWM output is derived combinationally as `count` < `duty_eff`, rather than imperatively setting and clearing the output, it is continuously evaluated every cycle as a comparator result.

`duty_eff` is the effective duty cycle, updated only at the start of each period. This ensures a mid-cycle change to `duty_ip` takes effect cleanly at the next period boundary rather than producing a malformed pulse.

## Synthesis Results (Artix-7 xc7a35tcpg236-1)


| Metric           |      Value |
| ---------------- | ---------: |
| Clock constraint |    100 MHz |
| WNS              |   6.852 ns |
| Estimated Fmax   |   ~318 MHz |
| LUTs             | 12 (0.06%) |
| DSPs             |          0 |

Fmax calculated from WNS of 6.852ns against a 10ns constraint: 1/(10-6.852)ns ≈ 318 MHz.

## Simulation
Show Image

<img width="686" height="510" alt="image" src="https://github.com/user-attachments/assets/26ae4730-b97e-40b4-9255-b08451013037" />
