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

  def render("error.json", %{changeset: changeset}) do
    %{errors: serialize_errors(changeset.errors ++ changeset.changes.credential.errors)}
  end

  defp serialize_errors(errors) do
    Enum.reduce(errors, %{}, fn ({field, detail}, acc) ->
      Map.put(acc, field, render_detail(detail))
    end)
  end

  defp render_detail({message, values}) do
    Enum.reduce values, message, fn {k, v}, acc ->
      String.replace(acc, "%{#{k}}", to_string(v))
    end
  end
  defp render_detail(message) do
    message
  end
end
