defmodule HelloWorld do
  use Application

  def start(_type, _args) do
    port = Application.get_env(:hello_world, :port)
    Plug.Adapters.Cowboy.http(HelloWorld.Router, [], [port: port])
  end
end
