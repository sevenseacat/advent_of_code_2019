defmodule Day9 do
  def bench do
    Benchee.run(
      %{
        "day 9, part 1" => fn -> Advent.data(9) |> Day5.parse_input() |> Day5.part1(1) end
      },
      Application.get_env(:advent, :benchee)
    )

    :ok
  end
end
