defmodule AdventTest do
  use ExUnit.Case
  doctest Day1
  doctest Day2
  doctest Day4
  doctest Day6

  describe "Day 6" do
    test "sample input for part 1" do
      assert 42 == Day6.part1("COM)B\nB)C\nC)D\nD)E\nE)F\nB)G\nG)H\nD)I\nE)J\nJ)K\nK)L")
    end
  end
end
