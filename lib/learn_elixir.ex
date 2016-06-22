defmodule LearnElixir do
  @moduledoc """
  Functions written to satisfy the assignments from www.LearnElixir.tv,
  an excellent resource to learn all about Elixir.
  """

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
