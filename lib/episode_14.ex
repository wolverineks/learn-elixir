defmodule Episode14 do
  defmodule MyServer do

    defmodule Controller do
      alias Episode14.MyServer.Server
      alias Episode14.MyServer.MessageHandler

      def start(items \\ []) do
        Server.start(MessageHandler, items)
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
    end

    defmodule MessageHandler do
      alias Episode14.View

      def handle_message({:add, item}, _from, items) do
        items ++ [item]
      end

      def handle_message({:remove, item}, _from, items) do
        items -- [item]
      end

      def handle_message(:items, from, items) do
        send from, {:items, items}
        View.display_list(items)
        items
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
        receive do
          message ->
            state = callback_module.handle_message(message, parent, state)
            loop(callback_module, parent, state)
        end
      end
    end
  end

  defmodule MyGenServer do
    use GenServer
    alias Episode14.View

    def start(items \\ []) do
      {:ok, account} = GenServer.start(__MODULE__, items)
      account
    end

    def add(list, item) do
      GenServer.cast(list, {:add, item})
    end

    def remove(list, item) do
      GenServer.cast(list, {:remove, item})
    end

    def show(list) do
      GenServer.call(list, :items)
      |> View.display_list
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

  defmodule MyStruct do
    alias Episode14.View

    defstruct items: []

    def start(items \\ []) do
      %__MODULE__{items: items}
    end

    def add(list, item) do
      %{list | items: list.items ++ [item]}
    end

    def remove(list, item) do
      %{list | items: list.items -- [item]}
    end

    def show(list) do
      View.display_list(list.items)
    end
  end

  defmodule View do
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
