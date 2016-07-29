defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
    count(l, 0)
  end

  defp count([_ | tail], acc) do
    count(tail, acc + 1)
  end

  defp count(_, acc) do acc; end

  @spec reverse(list) :: list
  def reverse(l) do
        reverse(l, [])
  end

  defp reverse([head | tail], reversed) do
    reverse(tail, [head | reversed]);
  end

  defp reverse(_, reversed) do reversed end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    map(l, f, [])
  end

  defp map([head | tail], f, transformed) do
    map(tail, f, [f.(head) | transformed])
  end

  defp map(_, _, transformed) do
    reverse(transformed)
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    filter(l, f, [])
  end

  defp filter([head | tail], f, filtered) do
    if f.(head) do
        filter(tail, f, [head | filtered])
    else
        filter(tail, f, filtered)
    end
  end

  defp filter(_, _, filtered) do
    reverse(filtered)
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do
    _reduce(l, acc, f)
  end

  defp _reduce([head|tail], acc, f) do
    _reduce(tail, f.(head, acc), f)
  end

  defp _reduce(_, acc, _) do
    acc
  end

  @spec append(list, list) :: list
  def append(a, b) do
    _append(reverse(a), b)
  end

  defp _append([head | tail], acc) do
    _append(tail, [head | acc])
  end

  defp _append(_, acc) do acc end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    concat(ll, [])
  end

  defp concat([[head | tail1] | tail2], acc) do
    concat([tail1 | tail2], [head | acc])
  end

  defp concat([_ | tail], acc) do
      concat(tail, acc)
  end

  defp concat(_, acc) do
    reverse(acc)
  end
end
