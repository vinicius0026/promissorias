defmodule PromissoriasWeb.UserController do
  use PromissoriasWeb, :controller

  alias Promissorias.Accounts
  alias Promissorias.Accounts.User

  action_fallback(PromissoriasWeb.FallbackController)

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.json", users: users)
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def create(conn, user_params) do
    with {:ok, %User{} = user} <- Accounts.register_user(user_params) do
      conn
      |> put_status(:created)
      |> render("show.json", user: user)
    end
  end
end
