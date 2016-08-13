defmodule HelloWorld.HelloWorldController do
  use HelloWorld.Web, :controller

  def hello(conn, params) do
  name = hd params["name"] || "World"
  body = "Hello, #{String.capitalize(name)}!"

    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, body)
  end

  def goodbye(conn, _params) do
    body = "Goodbye!"

    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(404, body)
  end
end
