defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare([], []) do :equal end
  def compare([], _) do :sublist end
  def compare(_, []) do :superlist end
  def compare(a, b) do
      cond do
          a === b -> :equal
          sublist?(a,b) -> :sublist
          sublist?(b,a) -> :superlist
          true -> :unequal
      end
  end

  defp sublist?(a, b) do
    first_item = List.first(a)
    start = Enum.find_index(b, &(&1 == first_item))

    cond do
        !start -> false
        a === Enum.slice(b, start, Enum.count(a)) -> true
        true ->
            {_, right} = Enum.split(b, start + 1)
            sublist?(a, right)
    end
  end
end
