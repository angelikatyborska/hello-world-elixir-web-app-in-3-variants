defmodule HelloWorld do
  import Supervisor.Spec

  def start(_type, _args) do
    opts = [strategy: :one_for_one, name: HelloWorld.Supervisor]
    Supervisor.start_link([worker(HelloWorld.Server, [Application.get_env(:hello_world, :port)])], opts)
  end
end
