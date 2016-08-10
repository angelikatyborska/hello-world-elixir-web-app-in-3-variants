defmodule HelloWorld.Router do
  use Plug.Router

  plug Plug.Logger
  plug :match
  plug :dispatch

  get "/hello" do
    hello(conn)
  end

  get "/hello/:name" do
    hello(conn, name)
  end

  match _ do
    goodbye(conn)
  end

  defp hello(conn, name \\ "World") do
    body = "Hello, #{String.capitalize(name)}!"

    conn
    |> Plug.Conn.put_resp_content_type("text/plain")
    |> Plug.Conn.send_resp(200, body)
  end

  defp goodbye(conn) do
    body = "Goodbye!"

    conn
    |> Plug.Conn.put_resp_content_type("text/plain")
    |> Plug.Conn.send_resp(404, body)
  end
end