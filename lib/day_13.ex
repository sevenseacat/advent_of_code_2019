defmodule Day13 do
  def part1(input) do
    outputs = Intcode.new(input) |> Intcode.run() |> Intcode.outputs()

    outputs
    |> Enum.chunk_every(3)
    |> Enum.count(fn [_, _, id] -> id == 2 end)
  end

  def bench do
    Benchee.run(
      %{
        "day 13, part 1" => fn ->
          Advent.data(13) |> Intcode.from_string() |> part1()
        end
      },
      Application.get_env(:advent, :benchee)
    )

    :ok
  end
end
