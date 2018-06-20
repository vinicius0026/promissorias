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
    plug :fetch_session
    plug PromissoriasWeb.Auth
  end

  scope "/", PromissoriasWeb do
    pipe_through :browser # Use the default browser stack

    get "/", AppController, :index
  end

  scope "/api", PromissoriasWeb do
    pipe_through :api

    resources "/users", UserController, only: [:index, :show, :create]
  end

  scope "/auth", PromissoriasWeb do
    pipe_through :api

    post "/", SessionController, :login
    delete "/", SessionController, :logout
  end
end
