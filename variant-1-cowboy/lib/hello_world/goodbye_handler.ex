defmodule HelloWorld.GoodbyeHandler do
  def init(request, options) do
    headers = [{"content-type", "text/plain"}]
    body = "Goodbye!"

    request2 = :cowboy_req.reply(404, headers, body, request)
    {:ok, request2, options}
  end
end