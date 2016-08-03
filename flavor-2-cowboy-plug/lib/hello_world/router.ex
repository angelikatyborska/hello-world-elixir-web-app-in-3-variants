defmodule HelloWorld.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/:name" do
    greet(conn, name)
  end

  match _ do
    send_resp(conn, 404, "Goodbye!")
  end

  defp greet(conn, name) do
    body = "Hello, #{String.capitalize(name || "World")}!"

    conn
    |> Plug.Conn.put_resp_content_type("text/plain")
    |> Plug.Conn.send_resp(200, body)
  end
end