defmodule DNA do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> DNA.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
       Enum.map(dna, &get_rna_nucleotide/1)
  end

  defp get_rna_nucleotide(dna) do
    case dna do
        ?A -> ?U
        ?C -> ?G
        ?T -> ?A
        ?G -> ?C
        _ -> ''
    end
  end
end
