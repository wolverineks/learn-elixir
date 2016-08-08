defmodule Episode7 do
  @moduledoc """
  Functions written to satisfy the assignments from www.LearnElixir.tv,
  an excellent resource to learn all about Elixir.
  """

  @doc """
  Create a Stream of all the months in a year.

  ## Parameters

    - an integer

  ## Examples

      iex> Episode7.list_months(2)
      ["January", "February"]

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
  Write a function that returns every other word in the sample.txt file
  which starts with “D”, sorted by length and capitalized.

  ## Parameters

  - a file path

  ## Examples

      iex> file_path = "lib/sample.txt"
      ...> Episode7.every_other_d(file_path)
      ["Drum", "Drill", "Diamond", "Data base"]
  """
  def every_other_d(file_path) do
    File.read!(file_path)
    |> String.split("\n")
    |> Stream.filter(fn word -> String.starts_with?(word, ["d", "D"]) end)
    |> Stream.take_every(2)
    |> Enum.sort(&(String.length(&1) < String.length(&2)))
    |> Stream.map(&(String.capitalize(&1)))
    |> Enum.into([])
  end

end
