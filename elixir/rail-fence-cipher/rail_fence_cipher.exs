defmodule RailFenceCipher do
    import Integer, only: [is_even: 1]
  @doc """
  Encode a given plaintext to the corresponding rail fence ciphertext
  """
  @spec encode(String.t, pos_integer) :: String.t
  def encode(str, rails) do
    str
        |> String.graphemes
        |> Enum.with_index
        |> Enum.reduce(List.duplicate([], rails), fn({x, index}, acc) ->
               List.update_at(acc, get_rail_row(index, rails - 1), &([x|&1]))
               end)
        |> Enum.map(&Enum.reverse/1)
        |> Enum.join
  end

  @doc """
  Decode a given rail fence ciphertext to the corresponding plaintext
  """
  @spec decode(String.t, pos_integer) :: String.t
  def decode(str, rails) do
    graphemes = String.graphemes(str)

    graphemes
        |> get_row_letter_count(rails)
        |> build_rails(graphemes)
        |> get_decoded_message(length(graphemes))

  end

  @doc """
  Given the index of a character in a message, get the rail index it will be "placed" in
  """
  defp get_rail_row(_, 0) do 0 end
  defp get_rail_row(index, rails) when is_even(index) and rails <= 1 do 0 end
  defp get_rail_row(index, 1) do 1 end
  defp get_rail_row(index, rails) do
       if(is_even(trunc(index/rails))) do
            rem(index,rails)
       else
            rails - rem(index,rails)
       end
  end

  @doc """
  Given list of characters and the rail count, determine how many characters will be in each rail
  """
  defp get_row_letter_count(str, rails) do
    str
        |> Enum.with_index
        |> Enum.reduce(List.duplicate(0, rails), fn({x, index}, acc) ->
                List.update_at(acc, get_rail_row(index, rails - 1), &(&1 + 1))
                end)
  end

  @doc """
  Convert the string of characters into the rails
  """
  defp build_rails([head | tail], chars,  acc \\ []) do
    {x1, x2} = Enum.split(chars, head)
    build_rails(tail, x2, List.insert_at(acc, -1, x1))
  end
  defp build_rails(_, _, acc) do acc end

  @doc """
  Convert the rails into the original message
  """
  defp get_decoded_message(rail_rows, total_chars, index \\ 0, message \\ "") when index < total_chars do
    next_row_index = get_rail_row(index, length(rail_rows) - 1)
    [head | tail] = Enum.at(rail_rows, next_row_index)

    get_decoded_message(List.replace_at(rail_rows, next_row_index, tail), total_chars, index + 1, message <> head)
  end
  defp get_decoded_message(_, _, _,message) do message end

end
