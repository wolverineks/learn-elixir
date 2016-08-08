defmodule Episode6 do
  @moduledoc """
  Functions written to satisfy the assignments from www.LearnElixir.tv,
  an excellent resource to learn all about Elixir.
  """

  @doc """
  Write a function that implements map

  ## Parameters

  - a list
  - an anonymous function

  ## Examples

      iex> list = [1, 2, 3]
      ...> function = fn(number) -> number * 2 end
      ...> Episode6.map(list, function)
      [2, 4, 6]

  """
  def map(list, function), do: do_map(list, function, [])
  defp do_map([head|tail], function, accumulator) do
    new_value = function.(head)
    accumulator = [new_value | accumulator]
    do_map(tail, function, accumulator)
  end
  defp do_map([], _function, accumulator) do
    :lists.reverse(accumulator)
  end

  @doc """
  Write a sum function which calculates the total of a list of numbers.

  ## Parameters

  - a list of numbers

  ## Examples

      iex> list = [1, 2, 3]
      ...> Episode6.sum_list(list)
      6
  """
  def sum_list(list), do: do_sum_list(list, 0)
  defp do_sum_list([h|t], acc), do: do_sum_list(t, h + acc)
  defp do_sum_list([], acc), do: acc

  @doc """
  Generalize your sum function so that the user can pass in a function
  to customize what it does.

  ## Parameters

  - a list
  - a function

  ## Examples

      iex> list = [1, 2, 3]
      ...> function = fn(number) -> number * 2 end
      ...> Episode6.generalized_sum(list, function)
      12
  """
  def generalized_sum(list, fun), do: do_generalized_sum(list, fun, 0)
  defp do_generalized_sum([h|t], fun, acc), do: do_generalized_sum(t, fun, fun.(h) + acc)
  defp do_generalized_sum([], _, acc), do: acc

  @doc """
  Extra credit: Write your own reverse function.

  ## Parameters

  - a list

  ## Examples

      iex> list = [1, 2, 3]
      ...> Episode6.reverse(list)
      [3, 2, 1]
  """
  def reverse(list), do: do_reverse(list, [])
  defp do_reverse([h|t], acc), do: do_reverse(t, [h] ++ acc)
  defp do_reverse([], acc), do: acc

  def new_reverse(list), do: new_do_reverse(list, [])
  defp new_do_reverse([h|t], acc), do: new_do_reverse(t, [h | acc])
  defp new_do_reverse([], acc), do: acc

end
