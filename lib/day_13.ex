defmodule Day13 do
  use Advent.Day, no: 13

  def part1(input) do
    outputs = Intcode.new(input) |> Intcode.run() |> Intcode.outputs()

    outputs
    |> Enum.chunk_every(3)
    |> Enum.count(fn [_, _, id] -> id == 2 end)
  end

  def part2(input, show \\ false) do
    do_part2(
      Intcode.new(input)
      |> Intcode.update_program(0, 2),
      show
    )
    |> visualize()
    |> Enum.find(fn {{x, y}, _} -> x == -1 && y == 0 end)
  end

  def do_part2(%Intcode{} = intcode, show) do
    intcode = Intcode.run(intcode)

    case Intcode.status(intcode) do
      :paused ->
        # Move the paddle towards the ball so that it always hits the ball
        {{{ball_x, _}, _}, {{paddle_x, _}, _}} = find_ball_and_paddle(intcode)
        intcode = Intcode.add_input(intcode, compare(paddle_x, ball_x))

        if show do
          intcode
          |> visualize()
          |> display_image()
        end

        do_part2(intcode, show)

      :halted ->
        intcode
    end
  end

  defp find_ball_and_paddle(intcode) do
    visualization = visualize(intcode)

    ball = Enum.find(visualization, fn {_, tile} -> tile == 4 end)
    paddle = Enum.find(visualization, fn {_, tile} -> tile == 3 end)

    {ball, paddle}
  end

  def visualize(intcode) do
    intcode
    |> Intcode.outputs()
    |> Enum.chunk_every(3)
    |> Enum.reduce(Map.new(), fn [x, y, z], acc -> Map.put(acc, {x, -y}, z) end)
  end

  def display_image(visualization) do
    IEx.Helpers.clear()
    {score, tiles} = Map.pop(visualization, {-1, 0})
    IO.puts("SCORE: #{score}")

    tiles
    |> Day11.visualize(&to_tile/1)
    |> Day11.display_image()

    :timer.sleep(25)
  end

  defp to_tile(0), do: " "
  defp to_tile(1), do: "█"
  defp to_tile(2), do: "x"
  defp to_tile(3), do: "_"
  defp to_tile(4), do: "o"

  defp compare(a, b) when a < b, do: 1
  defp compare(a, b) when a > b, do: -1
  defp compare(a, a), do: 0

  def part1_verify, do: Advent.data(13) |> Intcode.from_string() |> part1()
  def part2_verify, do: Advent.data(13) |> Intcode.from_string() |> part2()
end
