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
end
