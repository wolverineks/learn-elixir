defmodule Episode14Test do
  use ExUnit.Case
  doctest Episode14.MyStruct
  import Episode14
  import ExUnit.CaptureIO
  alias Episode14.MyServer
  alias Episode14.MyGenServer
  alias Episode14.MyStruct

  setup do
    server_list    = MyServer.Controller.start([])
    genserver_list = MyGenServer.start([])
    struct_list    = MyStruct.start([])

    {:ok, server_list: server_list,
          genserver_list: genserver_list,
          struct_list: struct_list
    }
  end

  test "MyStruct add", %{struct_list: struct_list} do
    struct_list = MyStruct.add(struct_list, "qweqwe")
    assert struct_list.items == ["qweqwe"]
  end

  test "MyStruct remove", %{struct_list: struct_list} do
    struct_list = MyStruct.add(struct_list, "qweqwe")
    struct_list = MyStruct.remove(struct_list, "qweqwe")
    assert struct_list.items == []
  end

  test "MyStruct show", %{struct_list: struct_list} do
    struct_list = MyStruct.add(struct_list, "qweqwe")
    show = fn -> MyStruct.show(struct_list) end

    assert capture_io(show) == """
      --- List ---\n
       - qweqwe\n\n
      """
  end
end
