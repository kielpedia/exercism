defmodule Prime do

  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) when count > 0 do
    nth(count, 0, [])
  end

  defp nth(count, n, factors) do
    cond do
        !prime?(n, factors) -> nth(count, n + 1, factors)
        count != length(factors) + 1 -> nth(count, n + 1, List.insert_at(factors, -1, n))
        true -> n
    end
  end

  defp prime?(0, _) do false end
  defp prime?(1, _) do false end
  defp prime?(2, _) do true end
  defp prime?(n, factors) do
    max = trunc(:math.sqrt(n))
    Enum.take_while(factors, &(&1 <= max))
        |> Enum.all?(&(rem(n,&1) != 0))
  end

end