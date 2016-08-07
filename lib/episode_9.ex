defmodule Episode9 do
  @moduledoc """
  Functions written to satisfy the assignments from www.LearnElixir.tv,
  an excellent resource to learn all about Elixir.
  """
  import Kernel, except: [sigil_w: 2]

  @doc """
  # Override a built-in sigil.
  """
  def sigil_w(words, opts) do
    words
    |> String.split(" ")
    |> Enum.map(&String.capitalize(&1))
  end

end

defmodule MySigils do
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
end
