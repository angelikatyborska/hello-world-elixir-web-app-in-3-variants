defmodule HelloWorld do
  use Application

  def start(_type, _args) do
    port = Application.get_env(:hello_world, :port)

    path_list = [
      {"/hello/[:name]", HelloWorld.HelloHandler, []},
      {"/[...]", HelloWorld.GoodbyeHandler, []},
    ]

    routes = [{:_, path_list}]
    dispatch = :cowboy_router.compile(routes)
    opts = [port: port]
    env = [dispatch: dispatch]

    :cowboy.start_http(:http, 100, opts, [env: env])  end
end
