defmodule Day5 do
  use Advent.Day, no: 5

  def parts(program, input) do
    program
    |> Intcode.new(List.wrap(input))
    |> Intcode.run()
    |> Intcode.outputs()
    |> List.last()
  end

  def part1_verify, do: Advent.data(5) |> Intcode.from_string() |> parts(1)
  def part2_verify, do: Advent.data(5) |> Intcode.from_string() |> parts(5)
end
