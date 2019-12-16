defmodule Day9 do
  # This day just uses Day 5 (the intcode VM) with different input.

  def bench do
    Benchee.run(
      %{
        "day 9, part 1" => fn -> Advent.data(9) |> Intcode.from_string() |> Day5.parts(1) end,
        "day 9, part 2" => fn -> Advent.data(9) |> Intcode.from_string() |> Day5.parts(2) end
      },
      Application.get_env(:advent, :benchee)
    )

    :ok
  end
end
