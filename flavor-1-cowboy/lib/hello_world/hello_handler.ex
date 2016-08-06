defmodule HelloWorld.HelloHandler do
  def init(req, opts) do
    name = :cowboy_req.binding(:name, req, "World")
    headers = [{"content-type", "text/plain"}]
    body = "Hello, #{String.capitalize(name)}!"

    :cowboy_req.reply(200, headers, body, req)
    {:ok, req, opts}
  end
end