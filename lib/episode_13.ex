defmodule Episode13 do

  def speak do
    receive do
      {:say, msg} ->
        IO.puts(msg)
        speak
      _other ->
        speak
    end
  end

  @doc """
  Map over a given collection, using parallel process for each item

  ## Parameters

  - a list
  - an anonymous function

  ## Examples

      iex> list = [1, 2, 3, 4, 5]
      ...> function = fn number -> number * 2 end
      ...> Episode13.pmap(list, function)
      [2, 4, 6, 8, 10]
  """
  def pmap(collection, function) do
    collection
    |> Enum.map(&spawn_process(&1, self(), function))
    |> Enum.map(&await(&1))
  end

  defp spawn_process(item, parent, function) do
    spawn_link fn ->
      send parent, {self, function.(item)}
    end
  end

  defp await(pid) do
    receive do
      {^pid, result} ->
        result
    end
  end

end
