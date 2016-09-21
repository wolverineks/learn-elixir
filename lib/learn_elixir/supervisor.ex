defmodule LearnElixir.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    children = [
      worker(Episode14.GenServerTodoList, [], id: "1"),
      worker(Episode14.GenServerTodoList, [], id: "2"),
      worker(Episode14.GenServerTodoList, [], id: "3"),
      worker(Episode14.GenServerTodoList, [], id: "4"),
    ]

    supervise(children, strategy: :one_for_one)
  end
end
