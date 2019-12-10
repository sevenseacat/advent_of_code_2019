defmodule Advent do
  def data(day), do: File.read!("lib/data/day_#{day}")
  def test_data(name), do: File.read!("test/data/#{name}")
end
