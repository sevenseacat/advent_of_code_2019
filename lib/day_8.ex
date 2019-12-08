defmodule Day8 do
  @width 25
  @height 6

  @doc """
  iex> Day8.part1(["1","2","3","4","5","6","7","8","9","0","1","2"], 3, 2)
  1
  """
  def part1(input, width \\ @width, height \\ @height) do
    layer_size = width * height

    layer =
      input
      |> Enum.chunk_every(layer_size)
      |> Enum.map(&frequencies/1)
      |> Enum.min_by(fn map -> Map.get(map, "0") end)

    Map.get(layer, "1") * Map.get(layer, "2")
  end

  def parse_input(data) do
    data
    |> String.trim()
    |> String.codepoints()
  end

  # https://www.rosettacode.org/wiki/Letter_frequency#Elixir
  def frequencies(str) do
    Enum.reduce(str, Map.new(), fn c, acc -> Map.update(acc, c, 1, &(&1 + 1)) end)
  end

  def bench do
    Benchee.run(
      %{
        "day 8, part 1" => fn -> Advent.data(8) |> parse_input |> part1() end
      },
      Application.get_env(:advent, :benchee)
    )

    :ok
  end
end
