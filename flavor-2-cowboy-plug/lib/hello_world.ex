defmodule HelloWorld do
  import Supervisor.Spec

  def start(_type, _args) do
    port = Application.get_env(:hello_world, :port)
    children = [
      Plug.Adapters.Cowboy.child_spec(:http, HelloWorld.Router, [], [port: port])
    ]
    opts = [strategy: :one_for_one, name: HelloWorld.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
