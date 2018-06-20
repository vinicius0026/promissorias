defmodule PromissoriasWeb.SessionView do
  use PromissoriasWeb, :view

  def render("login.json", %{user: user}) do
    %{ok: true, info: "logged in", user: user}
  end

  def render("logout.json", _) do
    %{ok: true, info: "logged out"}
  end
end
