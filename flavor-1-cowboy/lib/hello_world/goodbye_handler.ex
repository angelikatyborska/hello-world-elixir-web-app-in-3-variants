defmodule HelloWorld.GoodbyeHandler do
  def init(req, opts) do
    headers = [{"content-type", "text/plain"}]
    body = "Goodbye!"

    :cowboy_req.reply(200, headers, body, req)
    {:ok, req, opts}
  end
end