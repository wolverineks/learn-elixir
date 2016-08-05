defmodule Episode2Test do
  use ExUnit.Case
  doctest Episode2
  import Episode2

  test "numbers" do
    assert is_integer(5)
    assert is_float(5.0)
  end

  test "atoms" do
    assert is_atom(:abc)
    assert is_atom(GenServer)
    assert is_atom(true)
    assert is_atom(false)
    assert is_atom(nil)
  end

  test "binaries" do
    assert is_binary("hello")
    refute is_binary('hello')
    assert is_binary(<<104, 101, 108, 108, 111>>)
    assert is_binary(
    """
    This is
    a multiline
    string/binary
    """
    )
  end

  test "maps" do
    map = %{a: 1, b: 2, c: 3}
    map_strings = %{"a" => 1, "b" => 2}

    assert is_map(map)
    assert map[:a] == 1
    assert map.a == 1
    assert is_map(map_strings)
    assert map_strings["a"] == 1
  end

  test "tuples" do
    tuple = {"a", 1}

    assert is_tuple(tuple)
    assert elem(tuple, 0) == "a"
    assert put_elem(tuple, 1, "abc") == {"a", "abc"}
  end

  test "lists" do
    list = [1, 2, 3]

    assert is_list(list)
    assert [0 | list] == [0, 1, 2, 3]
    assert list ++ [4] == [1, 2, 3, 4]
    assert List.insert_at(list, 2, "a") == [1, 2, "a", 3]
  end

  test "character lists" do
    char_list_letters = 'hello'
    char_list_numbers = [104, 101, 108, 108, 111]

    assert is_list(char_list_letters)
    assert is_list(char_list_numbers)
  end

  test "functions" do
    function = fn(a) -> a end

    assert is_function(function)
    assert function.(123) == 123
  end

  test "keyword lists" do
    keyword_list_longhand  = [{:a, 1}, {:b, 2}]
    keyword_list_shorthand = [a: 1, b: 2]

    assert keyword_list_longhand == keyword_list_shorthand
    assert is_list(keyword_list_longhand)
    assert keyword_list_longhand[:a] == 1
    assert is_list(keyword_list_shorthand)
    assert keyword_list_shorthand[:a] == 1
  end

  test "structs" do
    defmodule User do
      defstruct a: nil, b: nil, c: nil
    end
    struct1 = %{__struct__: User, a: 1, b: 2}
    struct2 = struct(User, [a: 1, b: 2])

    assert struct1.a == 1
    assert struct2.b == 2
    assert struct2.c == nil
  end
end
