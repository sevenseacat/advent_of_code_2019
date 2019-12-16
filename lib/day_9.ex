defmodule Day9 do
  use Advent.Day, no: 9

  # This day just uses Day 5 (the intcode VM) with different input.

  def part1_verify, do: Advent.data(9) |> Intcode.from_string() |> Day5.parts(1)
  def part2_verify, do: Advent.data(9) |> Intcode.from_string() |> Day5.parts(2)
end
