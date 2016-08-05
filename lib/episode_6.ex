defmodule Episode6 do
  @moduledoc """
  Functions written to satisfy the assignments from www.LearnElixir.tv,
  an excellent resource to learn all about Elixir.
  """
  import Kernel, except: [sigil_w: 2]

  @doc """
  Write a sum function which calculates the total of a list of numbers.
  """
  def sum_list(list), do: sum_list(list, 0)
  defp sum_list([h|t], acc), do: sum_list(t, h + acc)
  defp sum_list([], acc), do: acc

  @doc """
  Generalize your sum function so that the user can pass in a function
  to customize what it does.
  """
  def generalized_sum(list, fun), do: generalized_sum(list, fun, 0)
  defp generalized_sum([h|t], fun, acc), do: generalized_sum(t, fun, fun.(h) + acc)
  defp generalized_sum([], _, acc), do: acc

  @doc """
  Extra credit: Write your own reverse function.
  """
  def reverse(list), do: reverse(list, [])
  defp reverse([h|t], acc), do: reverse(t, [h] ++ acc)
  defp reverse([], acc), do: acc

end
