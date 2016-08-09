defmodule Episode14 do
  defmodule TodoList do

    def start do
      Episode14.Server.start(TodoList, [])
    end

    def add(list, item) do
      send(list, {:add, item})
    end

    def remove(list, item) do
      send(list, {:remove, item})
    end

    def show(list) do
      send(list, :items)
    end

    def handle_message({:add, item}, _from, items) do
      items ++ [item]
    end

    def handle_message({:remove, item}, _from, items) do
      items -- [item]
    end

    def handle_message(:items, from, items) do
      send from, {:items, items}
      display_list(items)
      items
    end

    def display_list(items) do
      items = Enum.map(items, fn item -> display_item(item) end)
      IO.puts """
      --- List ---
      #{items}
      """
    end

    def display_item(item) do
      "\n - #{item}\n"
    end
  end

  defmodule Server do

    def start(callback_module, state) do
      parent = self()
      spawn fn ->
        loop(callback_module, parent, state)
      end
    end

    def loop(callback_module, parent, state) do
      # IO.puts self()
      receive do
        message ->
          # IO.puts message
          state = callback_module.handle_message(message, parent, state)
          loop(callback_module, parent, state)
      end
    end
  end

  defmodule GenServerTodoList do
    use GenServer

    def init(items) do
      {:ok, items}
    end

    def handle_cast({:add, item}, items) do
      {:noreply, items ++ [item]}
    end

    def handle_cast({:remove, item}, items) do
      {:noreply, items -- [item]}
    end

    def handle_call(:items, _from, items) do
      {:reply, items, items}
    end
  end

  defmodule StructTodoList do
    defstruct items: []

    def start(items) do
      %__MODULE__{items: items}
    end

    def add(list, item) do
      %{list | items: list.items ++ [item]}
    end

    def remove(list, item) do
      %{list | items: list.items -- [item]}
    end

    def show(list) do
      display_list(list.items)
    end

    def display_list(items) do
      items = Enum.map(items, fn item -> display_item(item) end)
      IO.puts """
      --- List ---
      #{items}
      """
    end

    def display_item(item) do
      "\n - #{item}\n"
    end
  end
end
