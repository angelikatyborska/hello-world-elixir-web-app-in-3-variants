defmodule HelloWorld do
  require Logger
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
    onresponse = fn(status, headers, body, request) ->
      method = elem(request, 5)
      path = elem(request, 11)
      Logger.info("#{method} #{path} - #{status}")
      request
    end

    :cowboy.start_http(:http, 100, opts, [env: env, onresponse: onresponse])  end
end
