defmodule PromissoriasWeb.UserController do
  use PromissoriasWeb, :controller

  alias Promissorias.Accounts

  plug :authenticate when action in [:index, :show, :create]

  def index(conn, _params) do
    users = Accounts.list_users()
    render conn, "index.json", users: users
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user(id)
    render conn, "show.json", user: user
  end

  def create(conn, %{"credential" => _creds} = user_params) do
    case Accounts.register_user(user_params) do
      {:ok, user} ->
        render(conn, "show.json", user: user)
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_status(:bad_request)
        |> render("error.json", changeset: changeset)
    end
  end

  def create(conn, _user_params) do
    conn
    |> put_status(:bad_request)
    |> render("error.json", changeset: %{ errors: [credential: "missing credentials"]})
  end

  defp authenticate(conn, _opts) do
    if conn.assigns.current_user do
      conn
    else
      conn
      |> put_status(:unauthorized)
      |> halt()
    end
  end
end
