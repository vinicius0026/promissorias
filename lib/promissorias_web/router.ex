defmodule PromissoriasWeb.Router do
  use PromissoriasWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PromissoriasWeb do
    pipe_through :browser # Use the default browser stack

    get "/", AppController, :index
  end

  scope "/auth", PromissoriasWeb do
    pipe_through :api

    post "/", AuthController, :login
  end
end
