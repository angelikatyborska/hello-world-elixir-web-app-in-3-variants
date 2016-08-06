defmodule HelloWorld.Server do
  def start_link(port) do
    routes = [
      {"/hello/[:name]", HelloWorld.HelloHandler, []},
      {"/[...]", HelloWorld.GoodbyeHandler, []},
    ]

    dispatch = :cowboy_router.compile([{:_, routes}])

    opts = [port: port]
    env = [dispatch: dispatch]

    :cowboy.start_http(:http, 100, opts, [env: env])
  end
end
