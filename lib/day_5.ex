defmodule Day5 do
  def part1(program, input) do
    run_program(program, input)
    |> elem(1)
  end

  def part2(program, input) do
    run_program(program, input)
    |> elem(1)
  end

  def run_program(array, input \\ nil, pos \\ 0, outputs \\ []) do
    raw_opcode = :array.get(pos, array)

    modes =
      div(raw_opcode, 100)
      |> Integer.to_string()
      |> String.reverse()

    opcode = rem(raw_opcode, 100)

    case opcode do
      1 ->
        calc(&Kernel.+/2, array, pos, modes) |> run_program(input, pos + 4, outputs)

      2 ->
        calc(&Kernel.*/2, array, pos, modes) |> run_program(input, pos + 4, outputs)

      3 ->
        assign(array, pos, input) |> run_program(input, pos + 2, outputs)

      4 ->
        {array, outputs} = output(array, pos, modes, outputs)
        run_program(array, input, pos + 2, outputs)

      5 ->
        new_pos = jump_if(&Kernel.!=/2, array, pos, modes)
        run_program(array, input, new_pos, outputs)

      6 ->
        new_pos = jump_if(&Kernel.==/2, array, pos, modes)
        run_program(array, input, new_pos, outputs)

      7 ->
        comparison(&Kernel.</2, array, pos, modes) |> run_program(input, pos + 4, outputs)

      8 ->
        comparison(&Kernel.==/2, array, pos, modes) |> run_program(input, pos + 4, outputs)

      99 ->
        {:array.to_list(array), Enum.reverse(outputs)}

      val ->
        {:error, "'#{val}' at position #{pos} does not match a valid opcode"}
    end
  end

  def jump_if(op, array, pos, modes) do
    if op.(calc_with_mode(array, pos, 1, modes), 0) do
      calc_with_mode(array, pos, 2, modes)
    else
      pos + 3
    end
  end

  def comparison(op, array, pos, modes) do
    op1 = calc_with_mode(array, pos, 1, modes)
    op2 = calc_with_mode(array, pos, 2, modes)

    new_val = if op.(op1, op2), do: 1, else: 0

    :array.set(:array.get(pos + 3, array), new_val, array)
  end

  defp calc(op, array, pos, modes) do
    op1 = calc_with_mode(array, pos, 1, modes)
    op2 = calc_with_mode(array, pos, 2, modes)

    :array.set(:array.get(pos + 3, array), op.(op1, op2), array)
  end

  defp calc_with_mode(array, pos, offset, modes) do
    case String.at(modes, offset - 1) do
      "1" ->
        :array.get(pos + offset, array)

      # Might be 0 or a trailing nil
      _ ->
        :array.get(:array.get(pos + offset, array), array)
    end
  end

  def assign(array, pos, val) do
    :array.set(:array.get(pos + 1, array), val, array)
  end

  def output(array, pos, modes, outputs) do
    {array, [calc_with_mode(array, pos, 1, modes) | outputs]}
  end

  def parse_input(data) do
    data
    |> String.trim()
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
    |> :array.from_list()
  end

  def bench do
    Benchee.run(
      %{
        "day 5, part 1" => fn -> Advent.data(5) |> parse_input |> part1(1) end,
        "day 5, part 2" => fn -> Advent.data(5) |> parse_input |> part2(5) end
      },
      Application.get_env(:advent, :benchee)
    )

    :ok
  end
end