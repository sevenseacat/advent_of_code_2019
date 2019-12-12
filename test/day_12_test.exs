defmodule Day12Test do
  use ExUnit.Case
  alias Day12.Moon
  doctest Day12

  describe "part1/2" do
    test "sample input 1" do
      actual = Day12.part1([{-1, 0, 2}, {2, -10, -7}, {4, -8, 8}, {3, 5, -1}], 10)
      assert 179 == actual
    end

    test "sample input 2" do
      actual = Day12.part1([{-8, -10, 0}, {5, 5, 10}, {2, -7, 3}, {9, -8, -3}], 100)
      assert 1940 == actual
    end
  end

  describe "do_part1/2" do
    test "sample input 1 - 1 loop" do
      actual = Day12.do_part1([{-1, 0, 2}, {2, -10, -7}, {4, -8, 8}, {3, 5, -1}], 1)

      expected = %{
        a: %Moon{position: {2, -1, 1}, velocity: {3, -1, -1}},
        b: %Moon{position: {3, -7, -4}, velocity: {1, 3, 3}},
        c: %Moon{position: {1, -7, 5}, velocity: {-3, 1, -3}},
        d: %Moon{position: {2, 2, 0}, velocity: {-1, -3, 1}}
      }

      assert actual == expected
    end
  end
end
