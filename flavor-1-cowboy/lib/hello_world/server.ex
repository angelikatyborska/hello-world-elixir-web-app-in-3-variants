defmodule HelloWorld.Server do
  def start_link(options) do
    path_list = [
      {"/hello/[:name]", HelloWorld.HelloHandler, []},
      {"/[...]", HelloWorld.GoodbyeHandler, []},
    ]

    routes = [{:_, path_list}]
    dispatch = :cowboy_router.compile(routes)
    opts = [port: options[:port]]
    env = [dispatch: dispatch]

    :cowboy.start_http(:http, 100, opts, [env: env])
  end
end
