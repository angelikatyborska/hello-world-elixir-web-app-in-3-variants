defmodule HelloWorld.HelloHandler do
  def init(request, options) do
    name = :cowboy_req.binding(:name, request, "World")
    headers = [{"content-type", "text/plain"}]
    body = "Hello, #{String.capitalize(name)}!"

    request2 = :cowboy_req.reply(200, headers, body, request)
    {:ok, request2, options}
  end
end