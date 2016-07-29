defmodule Bob do
  import String, only: [ends_with?: 2, upcase: 1, strip: 1]

  def hey(input) do
    cond do
        ends_with?(input, "?") -> "Sure."
        strip(input) == "" -> "Fine. Be that way!"
        (String.match?(input, ~r/\p{L}/) and upcase(input) == input) -> "Whoa, chill out!"
        true -> "Whatever."
    end
  end
end
