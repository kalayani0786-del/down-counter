# Verilog Down Counter

A simple and parameterized **down counter designed using Verilog HDL**.

The counter decreases its value by `1` on every rising edge of the clock when `enable` is HIGH.

## Features

* Written in Verilog HDL
* Synchronous down counter
* Parameterized counter width
* Reset functionality
* Enable control
* Automatic wrap-around
* Includes simulation testbench

## Project Structure

```text
verilog-down-counter/
│
├── down_counter.v
├── down_counter_tb.v
└── README.md
```

## Module Ports

| Port     | Direction | Description           |
| -------- | --------- | --------------------- |
| `clk`    | Input     | Clock signal          |
| `reset`  | Input     | Resets the counter    |
| `enable` | Input     | Enables counting      |
| `count`  | Output    | Current counter value |

## Working Principle

This project uses a **4-bit counter** by default.

After reset, the counter starts at:

```text
1111 = 15
```

When `enable = 1`, the counter decreases by one on every positive edge of `clk`.

### Counting sequence

```text
15 → 14 → 13 → 12 → 11 → 10 → 9 → 8
   → 7 → 6 → 5 → 4 → 3 → 2 → 1 → 0
```

After reaching `0`, the next decrement causes the 4-bit counter to wrap around to:

```text
0 - 1 = 15
```

Therefore, the continuous counting sequence is:

```text
15 → 14 → 13 → ... → 2 → 1 → 0 → 15 → 14 → ...
```

## Reset

When `reset = 1`, the counter is loaded with all ones.

For a 4-bit counter:

```text
reset = 1
count = 1111
```

When reset is released, counting begins if `enable` is HIGH.

## Enable

The `enable` input controls whether the counter changes.

```text
enable = 1  → Counter decrements
enable = 0  → Counter holds its current value
```

## Example Output

For a 4-bit counter, the expected simulation sequence is:

```text
Time   Count
10     15
20     14
30     13
40     12
50     11
60     10
70      9
80      8
90      7
100     6
110     5
120     4
130     3
140     2
150     1
160     0
170    15
180    14
```

## Simulation

The design can be simulated using:

* Icarus Verilog
* ModelSim
* QuestaSim
* Vivado
* Verilator
* Intel Quartus

### Using Icarus Verilog

Compile:

```bash
iverilog -o down_counter_tb down_counter.v down_counter_tb.v
```

Run:

```bash
vvp down_counter_tb
```

## Expected Output

```text
Time = 15 | Reset = 0 | Enable = 1 | Count = 15
Time = 25 | Reset = 0 | Enable = 1 | Count = 14
Time = 35 | Reset = 0 | Enable = 1 | Count = 13
Time = 45 | Reset = 0 | Enable = 1 | Count = 12
...
Time = 155 | Reset = 0 | Enable = 1 | Count = 1
Time = 165 | Reset = 0 | Enable = 1 | Count = 0
Time = 175 | Reset = 0 | Enable = 1 | Count = 15
```

## Parameterization

The counter width can be changed using the `WIDTH` parameter.

For example, an 8-bit counter:

```verilog
down_counter #(
    .WIDTH(8)
) counter (
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .count(count)
);
```

An 8-bit counter counts:

```text
255 → 254 → 253 → ... → 2 → 1 → 0 → 255
```

## Applications

Down counters are commonly used in:

* Digital clocks
* Timers
* Frequency dividers
* Event counters
* FPGA projects
* Digital systems
* Control systems
* Countdown circuits

## Future Improvements

Possible extensions include:

* Up/down counter
* Loadable counter
* Programmable countdown value
* Terminal-count output
* Seven-segment display interface
* FPGA implementation
* Clock-enable and pause functionality

## License

This project is open source and can be used for educational and personal projects.

```
```
