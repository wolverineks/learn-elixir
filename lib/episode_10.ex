defmodule Episode10 do
  @prefix Application.get_env(:learn_elixir, __MODULE__)[:prefix]
  @moduledoc """
  Functions written to satisfy the assignments from www.LearnElixir.tv,
  an excellent resource to learn all about Elixir.
  """
  def encrypt(text) do
    @prefix <> String.reverse(text)
  end

end
