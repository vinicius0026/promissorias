defmodule PromissoriasWeb.AuthController do
  use PromissoriasWeb, :controller

  def login(conn, params) do
    IO.puts inspect(conn)
    IO.puts inspect(params)

    user = %{username: "username"}

    render conn, "login.json", user: user
  end
end
