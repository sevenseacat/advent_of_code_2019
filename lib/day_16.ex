defmodule Day16 do
  use Advent.Day, no: 16

  alias Day16.PatternKeeper

  @doc """
  iex> Day16.part1("12345678", 1)
  "48226158"

  iex> Day16.part1("12345678", 2)
  "34040438"

  iex> Day16.part1("12345678", 3)
  "03415518"

  iex> Day16.part1("12345678", 4)
  "01029498"

  iex> Day16.part1("80871224585914546619083218645595", 100)
  "24176176"

  iex> Day16.part1("19617804207202209144916044189917", 100)
  "73745418"

  iex> Day16.part1("69317163492948606335995924319873", 100)
  "52432133"
  """
  def part1(input, phase) do
    PatternKeeper.start_link()

    input
    |> parse_input
    |> do_part1(0, phase)
    |> Enum.take(8)
    |> to_output
  end

  defp do_part1(input, phase, phase), do: input

  defp do_part1(input, phase, target_phase) do
    input
    |> do_digit(phase, 0)
    |> do_part1(phase + 1, target_phase)
  end

  defp do_digit(input, _, digit) when digit == length(input), do: []

  defp do_digit(input, phase, digit) do
    pattern = PatternKeeper.get_pattern_for_digit(digit)

    val =
      input
      |> Enum.zip(Stream.cycle(pattern))
      |> Enum.reduce(0, fn {a, b}, acc -> acc + a * b end)
      |> rem(10)
      |> abs

    [val | do_digit(input, phase, digit + 1)]
  end

  defp parse_input(input) do
    input
    |> String.trim()
    |> String.graphemes()
    |> Enum.map(&String.to_integer/1)
  end

  defp to_output(list) do
    list
    |> Enum.map(&Integer.to_string/1)
    |> List.to_string()
  end

  def part1_verify, do: Advent.data(16) |> Day16.part1(100)
  def part2_verify, do: nil
end

defmodule Day16.PatternKeeper do
  use GenServer

  @base_pattern [0, 1, 0, -1]

  # Public interface
  def start_link do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def get_pattern_for_digit(digit) do
    GenServer.call(__MODULE__, {:get_pattern_for_digit, digit})
  end

  # Private callbacks
  def init(:ok), do: {:ok, Map.new()}

  def handle_call({:get_pattern_for_digit, digit}, _from, state) do
    state =
      if Map.has_key?(state, digit) do
        state
      else
        [h | t] =
          @base_pattern |> Enum.map(fn i -> List.duplicate(i, digit + 1) end) |> Enum.concat()

        Map.put(state, digit, t ++ [h])
      end

    {:reply, Map.get(state, digit), state}
  end
end
