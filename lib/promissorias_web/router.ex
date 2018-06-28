defmodule PromissoriasWeb.Router do
  use PromissoriasWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
    plug(:fetch_session)
    plug(PromissoriasWeb.Auth)
  end

  scope "/", PromissoriasWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", AppController, :index)
  end

  scope "/api", PromissoriasWeb do
    pipe_through([:api, :authenticate_user])

    resources("/users", UserController, only: [:index, :show, :create, :delete])
    resources("/customers", CustomerController)
    resources("/promissory_notes", PromissoryNoteController)
  end

  scope "/auth", PromissoriasWeb do
    pipe_through(:api)

    post("/", SessionController, :login)
    delete("/", SessionController, :logout)
  end
end
