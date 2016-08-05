defmodule Episode7 do
  @moduledoc """
  Functions written to satisfy the assignments from www.LearnElixir.tv,
  an excellent resource to learn all about Elixir.
  """

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

end
