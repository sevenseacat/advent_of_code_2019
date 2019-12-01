defmodule Day1 do
  def part1(input) do
    input
    |> Enum.map(&fuel_mass/1)
    |> Enum.sum()
  end

  def parse_input(data) do
    data
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&String.to_integer/1)
  end

  @doc """
  iex> Day1.fuel_mass(12)
  2

  iex> Day1.fuel_mass(14)
  2

  iex> Day1.fuel_mass(1969)
  654

  iex> Day1.fuel_mass(100756)
  33583
  """
  def fuel_mass(num), do: div(num, 3) - 2

  def bench do
    Benchee.run(
      %{
        "day 1, part 1" => fn -> Advent.data(1) |> parse_input |> part1() end
      },
      Application.get_env(:advent, :benchee)
    )

    :ok
  end
end
