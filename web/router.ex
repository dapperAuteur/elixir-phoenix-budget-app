defmodule Budget.Router do
  use Budget.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Budget.Auth, repo: Budget.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Budget do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController, only: [:index, :show, :new, :create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Budget do
  #   pipe_through :api
  # end
end
