defmodule PromissoriasWeb.AppController do
  use PromissoriasWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
