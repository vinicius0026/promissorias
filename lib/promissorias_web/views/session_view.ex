defmodule PromissoriasWeb.SessionView do
  use PromissoriasWeb, :view

  def render("login.json", %{user: user}) do
    %{ok: true, info: "logged in", user: user}
  end

  def render("logout.json", _) do
    %{ok: true, info: "logged out"}
  end

  def render("unauthorized.json", _) do
    %{ok: false, info: "incorrect credentials"}
  end
end
