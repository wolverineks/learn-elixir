defmodule Episode10 do
  @prefix Application.get_env(:learn_elixir, __MODULE__)[:prefix]
  @moduledoc """
  Functions written to satisfy the assignments from www.LearnElixir.tv,
  an excellent resource to learn all about Elixir.
  """

  @doc """
  'Encrypt' any string
  Warning: Not actual encryption.
  DO NOT USE IN PRODUCTION

  The output of this function is automatically prefixed with the name of the environment. i.e. 'Test: ', 'Dev: ', 'Prod: '

  ## Parameters

  - a string

  ## Examples

      iex> Episode10.encrypt("hello")
      "Test: olleh"
  """
  def encrypt(text) do
    @prefix <> String.reverse(text)
  end

end
