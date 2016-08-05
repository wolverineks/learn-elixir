defmodule Episode10 do
  @moduledoc """
  Functions written to satisfy the assignments from www.LearnElixir.tv,
  an excellent resource to learn all about Elixir.
  """
  import Kernel, except: [sigil_w: 2]

  @doc """
  Create a Stream of all the months in a year.
  """
  def list_months(num_of_months) do
    year = ["January", "February", "March",
    "April", "May", "June", "July", "August", "September", "October",
    "November", "December"]

    year
    |> Stream.cycle()
    |> Enum.take(num_of_months)
  end

  @doc """
  Write a function that returns every other word in the sample.txt file
  which starts with “D”, sorted by length and capitalized.
  """
  def every_other_d(file_path) do
    File.read("lib/sample.txt")
    |> Tuple.to_list
    |> Enum.at(1)
    |> String.split("\n")
    |> Enum.filter(fn word -> String.starts_with?(word, ["d", "D"]) end)
    |> Enum.take_every(2)
    |> Enum.sort(&(String.length(&1) < String.length(&2)))
    |> Enum.map(&(String.capitalize(&1)))
  end

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

  # @doc """
  # Create your own sigil.
  # split, to int, map to doubl, reverse, join, to int
  # """
  def sigil_z(string, opts) do
    string
    |> String.codepoints()
    |> Enum.map(&String.to_integer(&1))
    |> Enum.map(&(&1 * 2))
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
