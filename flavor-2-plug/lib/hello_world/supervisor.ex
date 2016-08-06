defmodule HelloWorld.Supervisor do
  use Supervisor

  def start_link(options) do
    Supervisor.start_link(__MODULE__, options, name: __MODULE__)
  end

  def init(options) do
    children = [
      worker(HelloWorld.Server, [options])
    ]

    supervise(children, strategy: :one_for_one)
  end
end