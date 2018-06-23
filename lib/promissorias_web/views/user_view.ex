defmodule PromissoriasWeb.UserView do
  use PromissoriasWeb, :view

  def render("index.json", %{users: users}) do
    %{users: render_many(users, PromissoriasWeb.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{user: render_one(user, PromissoriasWeb.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    user
  end
end
