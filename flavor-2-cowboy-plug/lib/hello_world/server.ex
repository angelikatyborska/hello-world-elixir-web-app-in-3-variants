defmodule HelloWorld.Server do
  def start_link(options) do
    Plug.Adapters.Cowboy.http(HelloWorld.Router, [], [port: options[:port]])
  end
end
