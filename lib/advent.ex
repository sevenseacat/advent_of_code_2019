defmodule Advent do
  def data(day), do: File.read!("lib/data/day_#{day}")
  def test_data(name), do: File.read!("test/data/#{name}")

  # http://www.petecorey.com/blog/2018/11/12/permutations-with-and-without-repetition-in-elixir/
  def permutations([], _), do: [[]]
  def permutations(_list, 0), do: [[]]

  def permutations(list, k) do
    for head <- list, tail <- permutations(list -- [head], k - 1), do: [head | tail]
  end
end
