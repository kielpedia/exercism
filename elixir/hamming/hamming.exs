defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer

  def hamming_distance(strand1, strand2) when length(strand1) == length(strand2) do
    Enum.zip(strand1, strand2)
        |> Enum.filter(fn({l1, l2}) -> l1 != l2 end)
        |> length
        |> (&({:ok, &1})).()
  end

  def hamming_distance(strand1, strand2) do
    {:error, "Lists must be the same length."}
  end

end
