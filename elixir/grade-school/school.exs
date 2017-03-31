defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(map, String.t, integer) :: map
  def add(db, name, grade) do
       Map.update(db, grade, [name], &([name | &1]))
  end

  @doc """
  Return the names of the students in a particular grade.
  """
  @spec grade(map, integer) :: [String.t]
  def grade(db, grade) do
    Map.get(db, grade, [])
  end

  @doc """
  Sorts the school by grade and name.
  """
  @spec sort(map) :: [{integer, [String.t]}]
  def sort(db) do
        sorted_vals = for {key, val} <- db, do: {key, Enum.sort(val)}
        Enum.sort(sorted_vals, fn({key1, _}, {key2, _}) -> key1 < key2 end) # this seems unnecessary but i dont think the map ordering can be trusted
  end
end
