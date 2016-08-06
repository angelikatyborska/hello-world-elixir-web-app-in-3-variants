defmodule HelloWorld do
  use Application

  def start(_type, _args) do
    HelloWorld.Supervisor.start_link([])
  end
end
