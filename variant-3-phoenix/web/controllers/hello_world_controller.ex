defmodule HelloWorld.HelloWorldController do
  use HelloWorld.Web, :controller

  def hello(conn, params) do
    name = params["name"] || "World"
    body = "Hello, #{String.capitalize(name)}!"

    conn
    |> put_status(200)
    |> text(body)
  end

  def goodbye(conn, _params) do
    body = "Goodbye!"

    conn
    |> put_status(404)
    |> text(body)
  end
end
