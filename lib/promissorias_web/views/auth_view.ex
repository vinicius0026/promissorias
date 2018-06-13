defmodule PromissoriasWeb.AuthView do
  use PromissoriasWeb, :view

  def render("login.json", %{user: user}) do
    %{data: user}
  end
end
