defmodule Episode14Test do
  use ExUnit.Case
  doctest Episode14.StructTodoList
  import Episode14.StructTodoList
  import ExUnit.CaptureIO
  alias Episode14.Server
  alias Episode14.StructTodoList

  setup do
    list = StructTodoList.start([])

    {:ok, list: list}
  end

  test "add", %{list: list} do
    list = StructTodoList.add(list, "qweqwe")
    assert list.items == ["qweqwe"]
  end

  test "remove", %{list: list} do
    list = StructTodoList.add(list, "qweqwe")
    list = StructTodoList.remove(list, "qweqwe")
    assert list.items == []
  end

  test "show", %{list: list} do
    show = fn -> StructTodoList.show(list) end

    assert capture_io(show) == """
    --- List ---\n\n
    """
  end
end
