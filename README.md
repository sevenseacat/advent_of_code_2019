# Advent of Code 2019

My Elixir solutions for the [Advent of Code 2019](http://adventofcode.com/2019).

## Benchmarks

If you're curious how long each of my solutions roughly takes to run. Run via:

```
iex> Enum.map(1..15, fn i -> String.to_existing_atom("Elixir.Day#{i}").bench() end)

Name                    ips        average  deviation         median         99th %
day 1, part 1       14.71 K       67.97 μs     ±8.67%          67 μs          86 μs
day 1, part 2        8.43 K      118.67 μs    ±22.04%         116 μs         170 μs

Name                    ips        average  deviation         median         99th %
day 2, part 1        6.82 K       0.147 ms    ±23.85%       0.144 ms       0.187 ms
day 2, part 2     0.00270 K      369.84 ms     ±0.78%      369.71 ms      376.99 ms

Name                    ips        average  deviation         median         99th %
day 3, part 1          6.62      150.95 ms     ±6.72%      151.33 ms      168.99 ms
day 3, part 2          2.38      419.31 ms    ±11.63%      405.18 ms      573.70 ms

Name                    ips        average  deviation         median         99th %
day 4, part 1          2.34      427.55 ms     ±1.43%      427.94 ms      440.98 ms
day 4, part 2          2.36      424.39 ms     ±1.38%      421.45 ms      438.19 ms

Name                    ips        average  deviation         median         99th %
day 5, part 1        2.58 K      387.21 μs     ±5.74%         383 μs         478 μs
day 5, part 2        2.02 K      493.97 μs     ±4.77%         488 μs      585.27 μs

Name                    ips        average  deviation         median         99th %
day 6, part 1          9.48      105.52 ms     ±1.08%      105.54 ms      108.02 ms
day 6, part 2         87.96       11.37 ms     ±3.99%       11.45 ms       12.19 ms

Name                    ips        average  deviation         median         99th %
day 7, part 1          3.63      275.76 ms     ±8.55%      272.92 ms      316.38 ms
day 7, part 2          4.00      249.85 ms     ±0.54%      249.93 ms      252.16 ms

Name                    ips        average  deviation         median         99th %
day 8, part 1        116.00        8.62 ms    ±18.16%        7.75 ms       11.97 ms
day 8, part 2        128.60        7.78 ms    ±18.57%        6.95 ms       10.76 ms

Name                    ips        average  deviation         median         99th %
day 9, part 1        1.10 K      0.00091 s     ±4.73%      0.00090 s      0.00108 s
day 9, part 2     0.00088 K         1.13 s     ±0.55%         1.13 s         1.14 s

Name                     ips        average  deviation         median         99th %
day 10, part 1          1.23         0.81 s     ±0.37%         0.81 s         0.82 s
day 10, part 2          0.80         1.26 s     ±0.25%         1.26 s         1.26 s

Name                     ips        average  deviation         median         99th %
day 11, part 1          3.42      292.49 ms     ±1.20%      292.40 ms      298.93 ms
day 11, part 2         39.97       25.02 ms     ±0.85%       24.99 ms       26.72 ms

Name                     ips        average  deviation         median         99th %
day 12, part 1         90.44       0.0111 s     ±6.63%       0.0106 s       0.0129 s
day 12, part 2          0.30         3.29 s     ±0.60%         3.29 s         3.30 s

Name                     ips        average  deviation         median         99th %
day 13, part 1         18.50       0.0541 s     ±0.43%       0.0540 s       0.0557 s
day 13, part 2        0.0168        59.48 s     ±0.00%        59.48 s        59.48 s

Name                     ips        average  deviation         median         99th %
day 14, part 1        350.94      0.00285 s     ±1.61%      0.00284 s      0.00300 s
day 14, part 2          0.40         2.49 s     ±0.22%         2.49 s         2.50 s

Name                     ips        average  deviation         median         99th %
day 15, part 1          2.89      345.51 ms     ±2.12%      348.74 ms      354.31 ms
day 15, part 2          1.46      684.07 ms     ±1.41%      681.17 ms      696.71 ms
```
