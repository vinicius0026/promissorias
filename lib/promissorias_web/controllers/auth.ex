defmodule PromissoriasWeb.Auth do
  import Plug.Conn

  alias Promissorias.Accounts

  def init(opts), do: opts

  def call(conn, _opts) do
    user_id = get_session(conn, :user_id)
    user = user_id && Accounts.get_user(user_id)
    assign(conn, :current_user, user)
  end

  def login(conn, user) do
    conn
    |> assign(:current_user, user)
    |> put_session(:user_id, user.id)
    |> configure_session(renew: true)
  end

  def login_by_email_and_pass(conn, email, given_pass) do
    case Accounts.authenticate_by_email_and_pass(email, given_pass) do
      {:ok, user} -> {:ok, login(conn, user)}
      {:error, :unauthorized} -> {:error, :unauthorized, conn}
      {:error, :not_found} -> {:error, :not_found, conn}
    end
  end

  def logout(conn) do
    configure_session(conn, drop: true)
  end

  def authenticate_user(conn, _opts) do
    if conn.assigns.current_user do
      conn
    else
      conn
      |> put_status(:unauthorized)
      |> Phoenix.Controller.put_view(PromissoriasWeb.SessionView)
      |> Phoenix.Controller.render("unauthorized.json")
      |> halt()
    end
  end

  def ensure_admin_privileges(conn, _opts) do
    if conn.assigns.current_user.credential.is_admin do
      conn
    else
      conn
      |> put_status(:unauthorized)
      |> Phoenix.Controller.put_view(PromissoriasWeb.SessionView)
      |> Phoenix.Controller.render("missing_privilege.json")
      |> halt()
    end
  end
end
