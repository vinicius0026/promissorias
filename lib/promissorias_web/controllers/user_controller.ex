defmodule PromissoriasWeb.UserController do
  use PromissoriasWeb, :controller

  alias Promissorias.Accounts

  def index(conn, _params) do
    users = Accounts.list_users()
    render conn, "index.json", users: users
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user(id)
    render conn, "show.json", user: user
  end

  def create(conn, user_params) do
    case Accounts.create_user(user_params) do
      {:ok, user} ->
        render(conn, "show.json", user: user)
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "error.json", changeset: changeset)
    end
  end
end
