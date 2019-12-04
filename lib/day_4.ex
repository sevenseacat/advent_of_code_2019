defmodule Day4 do
  @input 197_487..673_251

  def part1(range \\ @input) do
    Enum.count(range, &meets_criteria?/1)
  end

  def part2() do
  end

  @doc """
  iex> Day4.meets_criteria?(111111)
  true

  iex> Day4.meets_criteria?(223450)
  false

  iex> Day4.meets_criteria?(123789)
  false
  """
  def meets_criteria?(num) do
    str = Integer.to_string(num) |> String.codepoints()
    has_double?(str) && no_decreases?(str)
  end

  def has_double?([a, a | _]), do: true
  def has_double?([_, b | rest]), do: has_double?([b | rest])
  def has_double?([_ | _]), do: false

  def no_decreases?([_]), do: true
  def no_decreases?([a, b | rest]) when a <= b, do: no_decreases?([b | rest])
  def no_decreases?(_), do: false

  def bench do
    Benchee.run(
      %{
        "day 4, part 1" => fn -> part1() end
      },
      Application.get_env(:advent, :benchee)
    )

    :ok
  end
end
