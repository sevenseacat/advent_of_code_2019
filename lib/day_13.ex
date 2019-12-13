defmodule Day13 do
  def part1(input) do
    {:halt, {_program, outputs}} = Day5.run_program(input)

    outputs
    |> Enum.chunk_every(3)
    |> Enum.count(fn [_, _, id] -> id == 2 end)
  end

  def bench do
    Benchee.run(
      %{
        "day 13, part 1" => fn -> Advent.data(13) |> Day5.parse_input() |> part1() end
      },
      Application.get_env(:advent, :benchee)
    )

    :ok
  end
end
