defmodule TasksTest do
  use ExUnit.Case, async: true
  import Mix.Tasks.Encrypt
  import ExUnit.CaptureIO

  test "encrypt" do
    function = fn -> run(["-t", "hello"]) end

    assert capture_io(function) == "Test: olleh\n"
  end
end
