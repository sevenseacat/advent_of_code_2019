defmodule Day12.Moon do
  alias __MODULE__

  defstruct position: {0, 0, 0}, velocity: {0, 0, 0}

  def new(position), do: %Moon{position: position}
  def energy({_, %Moon{position: pos, velocity: vel}}), do: kinetic(pos) * kinetic(vel)
  def kinetic({a, b, c}), do: abs(a) + abs(b) + abs(c)

  def update_velocities([m1, m2], moons) do
    %Moon{position: {x1, y1, z1}, velocity: {a1, b1, c1}} = Map.get(moons, m1)
    %Moon{position: {x2, y2, z2}, velocity: {a2, b2, c2}} = Map.get(moons, m2)

    a1 = compare(x1, x2) + a1
    a2 = compare(x2, x1) + a2
    b1 = compare(y1, y2) + b1
    b2 = compare(y2, y1) + b2
    c1 = compare(z1, z2) + c1
    c2 = compare(z2, z1) + c2

    moons
    |> Map.update!(m1, fn m -> %{m | velocity: {a1, b1, c1}} end)
    |> Map.update!(m2, fn m -> %{m | velocity: {a2, b2, c2}} end)
  end

  defp compare(a, b) when a < b, do: 1
  defp compare(a, b) when a > b, do: -1
  defp compare(a, a), do: 0

  def update_positions(moons) do
    moons
    |> Enum.map(&update_position/1)
    |> Enum.into(%{})
  end

  defp update_position({id, %Moon{position: {x, y, z}, velocity: {a, b, c}}}) do
    {id, %Moon{position: {x + a, y + b, z + c}, velocity: {a, b, c}}}
  end
end

defmodule Day12 do
  alias Day12.Moon
  import Advent, only: [permutations: 2]

  @moons [{1, 4, 4}, {-4, -1, 19}, {-15, -14, 12}, {-17, 1, 10}]

  def part1(moons \\ @moons, steps \\ 1000) do
    moons
    |> do_parts(steps)
    |> calculate_energy
  end

  def part2(moons \\ @moons) do
    # -1 to run infinitely until the looping is done
    do_parts(moons, -1, {MapSet.new(), MapSet.new(), MapSet.new(), nil, nil, nil})
  end

  def do_parts(moons, steps, status \\ nil) do
    [:a, :b, :c, :d]
    |> Enum.zip(Enum.map(moons, &Moon.new/1))
    |> Enum.into(%{})
    |> run_movements(0, steps, status)
  end

  defp calculate_energy(moons) do
    moons
    |> Enum.map(&Moon.energy/1)
    |> Enum.sum()
  end

  defp run_movements(_, _, -1, {_, _, _, x, y, z})
       when x != nil and y != nil and z != nil do
    {x, y, z}
  end

  defp run_movements(moons, step, step, _), do: moons

  defp run_movements(moons, step, max_steps, status) do
    new_moons =
      moons
      |> Map.keys()
      |> permutations(2)
      |> no_dupe_comparisons
      |> Enum.reduce(moons, &Moon.update_velocities/2)
      |> Moon.update_positions()

    run_movements(new_moons, step + 1, max_steps, update_status(new_moons, status, step))
  end

  # Part 1 needs no status checking
  defp update_status(_moons, nil, _step), do: nil

  # Part 2 - some really hacky shit here
  # Repeating moon data means x,y,z and a,b,c(velocity) for every moon are all the same
  # x is a function of a, y is a function of b, z is a function of c
  # Store each {x,a} (etc.) value for each moon on each step to see when it starts looping
  # When all three parameters ({x,a}, {y,b}, {z,c}) have looped, return the steps that they loop at
  # The actual result will be the lowest common multiple of the three step numbers
  defp update_status(
         moons,
         {seen_x, seen_y, seen_z, x, y, z},
         step
       ) do
    {seen_x, new_x} = check_if_seen(moons, x, seen_x, step, 0)
    {seen_y, new_y} = check_if_seen(moons, y, seen_y, step, 1)
    {seen_z, new_z} = check_if_seen(moons, z, seen_z, step, 2)
    {seen_x, seen_y, seen_z, new_x, new_y, new_z}
  end

  defp check_if_seen(_, seen_at, _, _, _) when seen_at != nil do
    {nil, seen_at}
  end

  defp check_if_seen(moons, nil, seen, step, index) do
    new_seen =
      Enum.map(moons, fn {_id, moon} ->
        {
          moon |> Map.get(:position) |> elem(index),
          moon |> Map.get(:velocity) |> elem(index)
        }
      end)

    if MapSet.member?(seen, new_seen) do
      {nil, step}
    else
      {MapSet.put(seen, new_seen), nil}
    end
  end

  # Filter out duplicate comparisons, eg. no need to compare a and b and then b and a
  defp no_dupe_comparisons(list) do
    Enum.reduce(list, [], fn [a, b], list ->
      if [b, a] in list, do: list, else: [[a, b] | list]
    end)
  end

  def bench do
    Benchee.run(
      %{
        "day 12, part 1" => fn -> part1() end
      },
      Application.get_env(:advent, :benchee)
    )

    :ok
  end
end
