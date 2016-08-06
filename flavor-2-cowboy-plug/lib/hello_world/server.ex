defmodule HelloWorld.Server do
  def start_link(port) do
    Plug.Adapters.Cowboy.http(HelloWorld.Router, [], [port: port])
  end
end
