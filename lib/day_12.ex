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
    |> do_part1(steps)
    |> calculate_energy
  end

  def do_part1(moons, steps) do
    [:a, :b, :c, :d]
    |> Enum.zip(Enum.map(moons, &Moon.new/1))
    |> Enum.into(%{})
    |> run_movements(0, steps)
  end

  defp calculate_energy(moons) do
    moons
    |> Enum.map(&Moon.energy/1)
    |> Enum.sum()
  end

  defp run_movements(moons, step, step), do: moons

  defp run_movements(moons, step, max_steps) do
    moons
    |> Map.keys()
    |> permutations(2)
    |> no_dupe_comparisons
    |> Enum.reduce(moons, &Moon.update_velocities/2)
    |> Moon.update_positions()
    |> run_movements(step + 1, max_steps)
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
        "day 12, part 1" => fn -> Advent.data(12) |> part1() end
      },
      Application.get_env(:advent, :benchee)
    )

    :ok
  end
end
