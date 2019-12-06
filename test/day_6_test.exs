defmodule Day6Test do
  use ExUnit.Case
  doctest Day6

  describe "part1/1" do
    test "sample input" do
      assert 42 == Day6.part1("COM)B\nB)C\nC)D\nD)E\nE)F\nB)G\nG)H\nD)I\nE)J\nJ)K\nK)L")
    end
  end

  describe "part2/1" do
    test "sample input" do
      actual = Day6.part2("COM)B\nB)C\nC)D\nD)E\nE)F\nB)G\nG)H\nD)I\nE)J\nJ)K\nK)L\nK)YOU\nI)SAN")
      assert 4 == actual
    end
  end
end
