defmodule Episode4 do
  defmodule User do
    @moduledoc """
    Defines the user struct and functions.
    """
    import String, only: [split: 1]
    import List, only: [first: 1, last: 1]

    defstruct [name: nil, email: nil]

    @doc """
    Get the first name of a user.

    ## Parameters

    - `user` - A User struct.

    ## Examples

        iex> alias Episode4.User
        ...> user = %User{name: "Alice Winston"}
        ...> User.first_name(user)
        "Alice"
    """
    def first_name(user) do
      user
      |> get_names
      |> first
    end

    @doc """
    Get the last name of a user.

    ## Parameters

    - `user` - A User struct.

    ## Examples

        iex> alias Episode4.User
        ...> user = %User{name: "Alice Winston"}
        ...> User.last_name(user)
        "Winston"
    """
    def last_name(user) do
      user
      |> get_names
      |> last
    end

    defp get_names(user) do
      user.name
      |> split
    end
  end
end
