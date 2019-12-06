defmodule Day6 do
  def part1(input) do
    input
    |> parse_input
    |> build_tree
    |> count_orbits
  end

  defp build_tree(orbits) do
    graph = :digraph.new()

    Enum.reduce(orbits, graph, fn [object, orbiter], g ->
      :digraph.add_vertex(g, object)
      :digraph.add_vertex(g, orbiter)
      :digraph.add_edge(g, object, orbiter)
      g
    end)
  end

  defp count_orbits(graph) do
    Enum.reduce(:digraph.vertices(graph), 0, fn vertex, count ->
      count + Enum.count(:digraph_utils.reachable_neighbours([vertex], graph))
    end)
  end

  defp parse_input(data) do
    data
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn orbit -> String.split(orbit, ")") end)
  end

  def bench do
    Benchee.run(
      %{
        "day 6, part 1" => fn -> Advent.data(6) |> part1() end
      },
      Application.get_env(:advent, :benchee)
    )

    :ok
  end
end
