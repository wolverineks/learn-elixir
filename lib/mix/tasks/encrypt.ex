defmodule Mix.Tasks.Encrypt do
  use Mix.Task

  @shortdoc "Encrypts some arbitrary text"

  @moduledoc """
  Takes a -t option to specify which text to encrypt

      mix encrypt -t hello
  """
  def run(args) do
    {opts, _, _} = OptionParser.parse(args, aliases: [t: :text])
    IO.puts Episode10.encrypt(opts[:text])
  end
end
