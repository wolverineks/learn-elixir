defmodule Episode8 do
  @moduledoc """
  Functions written to satisfy the assignments from www.LearnElixir.tv,
  an excellent resource to learn all about Elixir.
  """
  import Kernel, except: [sigil_w: 2]
  import Integer, only: [is_even: 1]

  @doc """
  https://www.learnelixir.tv/episodes/08-comprehensions
  Create a function, using for, which will return all the even
  numbers up to a given number.
  """
  def even_numbers(max_num) do
    for num <- 1..max_num, is_even(num), do: num
  end

  @doc """
  https://www.learnelixir.tv/episodes/08-comprehensions
  Write a function, using for, which joins a list of binaries
  together with a separator.
  """
  def join_list(list, separator) do
    for binary <- list, into: "", do: "#{binary}#{separator}"
  end

  # @doc """
  # Create your own sigil.
  # split, to int, map to doubl, reverse, join, to int
  # """
  def sigil_z(string, opts) do
    string
    |> String.codepoints()
    |> Stream.map(&String.to_integer(&1))
    |> Stream.map(&(&1 * 2))
    |> Enum.reverse()
    |> Enum.join()
    |> String.to_integer()
  end

  @doc """
  # Override a built-in sigil.
  """
  def sigil_w(words, opts) do
    words
    |> String.split(" ")
    |> Enum.map(&String.capitalize(&1))
  end

end
