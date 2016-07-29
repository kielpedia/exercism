defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    base_freq = frequencies(base)
    candidates
        |> Enum.filter(&(String.downcase(&1) != String.downcase(base)))
        |> Enum.filter(&(frequencies(&1) == base_freq))
  end

  defp frequencies(string) do
    string
        |> String.downcase
        |> String.graphemes
        |> Enum.reduce(%{}, fn(x, acc) -> Map.update(acc, x, 1, &(&1 + 1)) end)
  end
end
