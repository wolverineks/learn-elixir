defmodule Episode8 do
  @moduledoc """
  Functions written to satisfy the assignments from www.LearnElixir.tv,
  an excellent resource to learn all about Elixir.
  """
  import Integer, only: [is_even: 1]

  @doc """
  https://www.learnelixir.tv/episodes/08-comprehensions
  Create a function, using for, which will return all the even
  numbers up to a given number.

  ## Parameters

  - an integer

  ## Examples

      iex> Episode8.even_numbers(9)
      [2, 4, 6, 8]
  """
  def even_numbers(max_num) do
    for num <- 1..max_num, is_even(num), do: num
  end

  @doc """
  https://www.learnelixir.tv/episodes/08-comprehensions
  Write a function, using for, which joins a list of binaries
  together with a separator.

  ## Parameters

  - a list
  - a string

  ## Examples

    iex> Episode8.join_list(["hello", "world"], "/")
    "/hello/world"
  """
  def join_list(list, separator) do
    for binary <- list, into: "", do: "#{separator}#{binary}"
  end

end
