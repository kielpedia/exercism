defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    str
        |> String.graphemes
        |> check_brackets([])
  end

  defp check_brackets([head | tail], stack) do
    last = List.last(stack)
    cond do
      head in ["{", "(", "["] -> check_brackets(tail, stack ++ [head])
      head in ["}", ")", "]"] ->
            if get_open(head) == last do
                check_brackets(tail, List.delete_at(stack, -1))
            else
                false
            end
      true -> check_brackets(tail, stack)
    end
  end

  defp check_brackets(_, stack) do
    length(stack) == 0
  end

  defp get_open("}") do "{" end
  defp get_open(")") do "(" end
  defp get_open("]") do "[" end
  defp get_open(_)   do nil end

end
