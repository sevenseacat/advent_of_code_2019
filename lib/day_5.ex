defmodule Day5 do
  def parts(program, input) do
    program
    |> Intcode.new(List.wrap(input))
    |> Intcode.run()
    |> Intcode.outputs()
  end

  def bench do
    Benchee.run(
      %{
        "day 5, part 1" => fn -> Advent.data(5) |> Intcode.from_string() |> parts(1) end,
        "day 5, part 2" => fn -> Advent.data(5) |> Intcode.from_string() |> parts(5) end
      },
      Application.get_env(:advent, :benchee)
    )

    :ok
  end
end
