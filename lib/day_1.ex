defmodule Day1 do
  @doc """
  """
  def part1(data) do
  end

  def bench do
    Benchee.run(
      %{
        "day 1, part 1" => fn -> Advent.data(1) |> part1() end
      },
      Application.get_env(:advent, :benchee)
    )

    :ok
  end
end
