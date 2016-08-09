defmodule Episode13Test do
  use ExUnit.Case
  doctest Episode13
  import Episode13
  import ExUnit.CaptureIO

  # test "speak" do
  #   pid = spawn(Episode13, :speak, [])
  #   message = {:say, "Hello, World."}
  #   function = fn -> send(pid, message) end
  #
  #   assert_receive(_, fn -> send(pid, message) end)
  # end

  test "pmap" do
    list = [1, 2, 3, 4, 5]
    function = fn number -> number * 2 end

    assert Episode13.pmap(list, function) == [2, 4, 6, 8, 10]
  end
end
