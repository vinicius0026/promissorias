defmodule PromissoriasWeb.SessionController do
  use PromissoriasWeb, :controller

  def login(conn, %{"email" => email, "password" => password}) do
    case PromissoriasWeb.Auth.login_by_email_and_pass(conn, email, password) do
      {:ok, conn} ->
        render(conn, "login.json", user: conn.assigns.current_user)

      {:error, _reason, conn} ->
        conn
        |> put_status(:unauthorized)
        |> render("unauthorized.json")
    end
  end

  def logout(conn, _) do
    conn
    |> PromissoriasWeb.Auth.logout()
    |> render("logout.json")
  end
end
