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
    onresponse = fn(status, _headers, _body, request) ->
      method = :cowboy_req.method(request)
      path = :cowboy_req.path(request)
      Logger.info("#{method} #{path} - #{status}")
      request
    end

    :cowboy.start_http(:http, 100, opts, [env: env, onresponse: onresponse])  end
end
