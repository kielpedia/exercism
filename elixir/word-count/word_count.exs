defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
       |> String.split
       |> Enum.group_by(&(&1), &Enum.count(&1))
  end
end
