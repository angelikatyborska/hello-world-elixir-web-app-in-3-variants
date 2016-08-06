defmodule HelloWorld do
  use Application

  def start(_type, _args) do
    port = Application.get_env(:hello_world, :port)
    HelloWorld.Supervisor.start_link([port: port])
  end
end
