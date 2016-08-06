defmodule HelloWorld.Server do
  def start_link(options) do
    routes = [
      {"/hello/[:name]", HelloWorld.HelloHandler, []},
      {"/[...]", HelloWorld.GoodbyeHandler, []},
    ]

    dispatch = :cowboy_router.compile([{:_, routes}])
    opts = [port: options[:port]]
    env = [dispatch: dispatch]

    :cowboy.start_http(:http, 100, opts, [env: env])
  end
end
