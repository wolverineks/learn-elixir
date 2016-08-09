defmodule Episode9 do
  @moduledoc """
  Functions written to satisfy the assignments from www.LearnElixir.tv,
  an excellent resource to learn all about Elixir.
  """
end

defmodule MySigils do
  import Kernel, except: [sigil_w: 2]

  @doc """
    Override a built-in sigil

  ## Parameters

  - any number of words

  ## Examples

      iex> import Kernel, except: [sigil_w: 2]
      ...> import Episode8
      ...> ~w(hello world!)
      ["Hello", "World!"]
  """
  def sigil_w(words, opts) do
    words
    |> String.split(" ")
    |> Enum.map(&String.capitalize(&1))
  end

  @doc """
  Create your own sigil.
  split, to int, map to double, reverse, join, to int

  ## Parameters

  - a string
  - options

  ## Examples

      iex> import Episode8
      ...> ~z(20349587)
      141610188604

  """
  def sigil_z(string, opts) do
    string
    |> String.codepoints()
    |> Stream.map(&String.to_integer(&1))
    |> Stream.map(&(&1 * 2))
    |> Enum.reverse()
    |> Enum.join()
    |> String.to_integer()
  end
end
