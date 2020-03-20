defmodule Day14Test do
  use ExUnit.Case

  describe "parse_input/1" do
    test "can parse inputs and outputs" do
      actual = Advent.test_data("day_14/sample_1") |> Day14.parse_input()

      assert [
               {[{"ORE", 10}], {"A", 10}},
               {[{"ORE", 1}], {"B", 1}},
               {[{"A", 7}, {"B", 1}], {"C", 1}},
               {[{"A", 7}, {"C", 1}], {"D", 1}},
               {[{"A", 7}, {"D", 1}], {"E", 1}},
               {[{"A", 7}, {"E", 1}], {"FUEL", 1}}
             ] == actual
    end
  end

  describe "part1/1" do
    test "sample input 1" do
      input = Advent.test_data("day_14/sample_1") |> Day14.parse_input()
      assert 31 == Day14.part1(input)
    end

    test "sample input 2" do
      input = Advent.test_data("day_14/sample_2") |> Day14.parse_input()
      assert 165 == Day14.part1(input)
    end

    test "sample input 3" do
      input = Advent.test_data("day_14/sample_3") |> Day14.parse_input()
      assert 13312 == Day14.part1(input)
    end

    test "sample input 4" do
      input = Advent.test_data("day_14/sample_4") |> Day14.parse_input()
      assert 180_697 == Day14.part1(input)
    end

    test "sample input 5" do
      input = Advent.test_data("day_14/sample_5") |> Day14.parse_input()
      assert 2_210_736 == Day14.part1(input)
    end
  end
end
