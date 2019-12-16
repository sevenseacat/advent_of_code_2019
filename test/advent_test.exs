defmodule AdventTest do
  use ExUnit.Case
  doctest Day1
  doctest Day2
  doctest Day4
  doctest Day5
  doctest Day7
  doctest Day8
  doctest Day9
  doctest Day11
  doctest Day13

  # Real solutions from the real problems with real input.
  describe "verification" do
    test "day 1, part 1", do: assert(Day1.part1_verify() == 3_299_598)
    test "day 1, part 2", do: assert(Day1.part2_verify() == 4_946_546)
    test "day 2, part 1", do: assert(Day2.part1_verify() == 3_224_742)
    test "day 2, part 2", do: assert(Day2.part2_verify() == 7960)
    test "day 3, part 1", do: assert(Day3.part1_verify() == 399)
    test "day 3, part 2", do: assert(Day3.part2_verify() == 15678)
    test "day 4, part 1", do: assert(Day4.part1_verify() == 1640)
    test "day 4, part 2", do: assert(Day4.part2_verify() == 1126)
    test "day 5, part 1", do: assert(Day5.part1_verify() == 6_745_903)
    test "day 5, part 2", do: assert(Day5.part2_verify() == 9_168_267)
    test "day 6, part 1", do: assert(Day6.part1_verify() == 122_782)
    test "day 6, part 2", do: assert(Day6.part2_verify() == 271)
    test "day 7, part 1", do: assert(Day7.part1_verify() == 929_800)
    test "day 7, part 2", do: assert(Day7.part2_verify() == 15_432_220)
    test "day 8, part 1", do: assert(Day8.part1_verify() == 2193)

    test "day 8, part 2" do
      # Prints out "YEHEF" when piped into Day8.display_image
      assert Day8.part2_verify() == [
        "1", "0", "0", "0", "1", "1", "1", "1", "1", "0", "1", "0", "0", "1", "0", "1",
        "1", "1", "1", "0", "1", "1", "1", "1", "0", "1", "0", "0", "0", "1", "1", "0",
        "0", "0", "0", "1", "0", "0", "1", "0", "1", "0", "0", "0", "0", "1", "0", "0",
        "0", "0", "0", "1", "0", "1", "0", "1", "1", "1", "0", "0", "1", "1", "1", "1",
        "0", "1", "1", "1", "0", "0", "1", "1", "1", "0", "0", "0", "0", "1", "0", "0",
        "1", "0", "0", "0", "0", "1", "0", "0", "1", "0", "1", "0", "0", "0", "0", "1",
        "0", "0", "0", "0", "0", "0", "1", "0", "0", "1", "0", "0", "0", "0", "1", "0",
        "0", "1", "0", "1", "0", "0", "0", "0", "1", "0", "0", "0", "0", "0", "0", "1",
        "0", "0", "1", "1", "1", "1", "0", "1", "0", "0", "1", "0", "1", "1", "1", "1",
        "0", "1", "0", "0", "0", "0"
      ]
    end

    test "day 9, part 1", do: assert(Day9.part1_verify() == 2_775_723_069)
    test "day 9, part 2", do: assert(Day9.part2_verify() == 49115)
    test "day 10, part 1", do: assert(Day10.part1_verify() == {{28, 29}, 340})
    test "day 10, part 2", do: assert(Day10.part2_verify() == 2628)
    test "day 11, part 1", do: assert(Day11.part1_verify() == 2293)

    test "day 11, part 2" do
      # Prints out "AHLCPRAL" when piped into Day11.display_image
      assert Day11.part2_verify() == [
        ["X", "X", ".", ".", "X", "X", ".", "X", "X", ".", "X", ".", "X", "X", "X",
        "X", "X", ".", ".", "X", "X", ".", ".", ".", "X", "X", ".", ".", ".", "X",
        "X", "X", ".", ".", "X", "X", ".", "X", "X", "X", "X", "X", "X"],
        ["X", ".", "X", "X", ".", "X", ".", "X", "X", ".", "X", ".", "X", "X", "X",
        "X", ".", "X", "X", ".", "X", ".", "X", "X", ".", "X", ".", "X", "X", ".",
        "X", ".", "X", "X", ".", "X", ".", "X", "X", "X", "X", "X", "X"],
        ["X", ".", "X", "X", ".", "X", ".", ".", ".", ".", "X", ".", "X", "X", "X",
        "X", ".", "X", "X", "X", "X", ".", "X", "X", ".", "X", ".", "X", "X", ".",
        "X", ".", "X", "X", ".", "X", ".", "X", "X", "X", "X", "X", "X"],
        ["X", ".", ".", ".", ".", "X", ".", "X", "X", ".", "X", ".", "X", "X", "X",
        "X", ".", "X", "X", "X", "X", ".", ".", ".", "X", "X", ".", ".", ".", "X",
        "X", ".", ".", ".", ".", "X", ".", "X", "X", "X", "X", "X", "X"],
        ["X", ".", "X", "X", ".", "X", ".", "X", "X", ".", "X", ".", "X", "X", "X",
        "X", ".", "X", "X", ".", "X", ".", "X", "X", "X", "X", ".", "X", ".", "X",
        "X", ".", "X", "X", ".", "X", ".", "X", "X", "X", "X", "X", "X"],
        ["X", ".", "X", "X", ".", "X", ".", "X", "X", ".", "X", ".", ".", ".", ".",
        "X", "X", ".", ".", "X", "X", ".", "X", "X", "X", "X", ".", "X", "X", ".",
        "X", ".", "X", "X", ".", "X", ".", ".", ".", ".", "X", "X", "X"]
      ]
    end

    test "day 12, part 1", do: assert(Day12.part1_verify() == 10635)
    test "day 12, part 2", do: assert(Day12.part2_verify() == {186_028, 231_614, 108_344})
    test "day 13, part 1", do: assert(Day13.part1_verify() == 315)
  end
end
