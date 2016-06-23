defmodule LearnElixir do
  @moduledoc """
  Functions written to satisfy the assignments from www.LearnElixir.tv,
  an excellent resource to learn all about Elixir.
  """

  @doc """
  Write a sum function which calculates the total of a list of numbers.
  """
  def sum_list(list), do: sum_list(list, 0)
  defp sum_list([h|t], acc), do: sum_list(t, h + acc)
  defp sum_list([], acc), do: acc

  @doc """
  Generalize your sum function so that the user can pass in a function to customize what it does.
  """
  def generalized_sum(list, fun), do: generalized_sum(list, fun, 0)
  defp generalized_sum([h|t], fun, acc), do: generalized_sum(t, fun, fun.(h) + acc)
  defp generalized_sum([], fun, acc), do: acc

  @doc """
  Extra credit: Write your own reverse function.
  """
  def reverse(list), do: reverse(list, [])
  defp reverse([h|t], acc), do: reverse(t, [h] ++ acc)
  defp reverse([], acc), do: acc

  @doc """
  https://www.learnelixir.tv/episodes/08-comprehensions
  Create a function, using for, which will return all the even
  numbers up to a given number.
  """
  def even_numbers(max_num) do
    require Integer
    for num <- 1..max_num, Integer.is_even(num), do: num
  end

  @doc """
  https://www.learnelixir.tv/episodes/08-comprehensions
  Write a function, using for, which joins a list of binaries
  together with a separator.
  """
  def join_list(list, separator) do
    for binary <- list, into: "", do: "#{binary}#{separator}"
  end
end
