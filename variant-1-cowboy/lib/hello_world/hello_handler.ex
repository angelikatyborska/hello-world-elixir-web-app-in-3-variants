defmodule HelloWorld.HelloHandler do
  def init(request, options) do
    if (:cowboy_req.method(request) == "GET") do
      name = :cowboy_req.binding(:name, request, "World")
      headers = [{"content-type", "text/plain"}]
      body = "Hello, #{String.capitalize(name)}!"

      request2 = :cowboy_req.reply(200, headers, body, request)
      {:ok, request2, options}
    else
      HelloWorld.GoodbyeHandler.init(request, options)
    end
  end
end