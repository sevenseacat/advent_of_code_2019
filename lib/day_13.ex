defmodule Day13 do
  use Advent.Day, no: 13

  def part1(input) do
    outputs = Intcode.new(input) |> Intcode.run() |> Intcode.outputs()

    outputs
    |> Enum.chunk_every(3)
    |> Enum.count(fn [_, _, id] -> id == 2 end)
  end

  def part1_verify, do: Advent.data(13) |> Intcode.from_string() |> part1()
  def part2_verify, do: nil
end
