defmodule HelloWorld.Supervisor do
  use Supervisor

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg)
  end

  def init(_args) do
    port = Application.get_env(:hello_world, :port)

    children = [
      worker(HelloWorld.Server, [port])
    ]

    supervise(children, strategy: :one_for_one)
  end
end