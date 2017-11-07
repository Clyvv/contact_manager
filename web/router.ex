defmodule ContactManager.Router do
  use ContactManager.Web, :router

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

  scope "/", ContactManager do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController
    resources "/titles", TitleController
  end

  # Other scopes may use custom stacks.
  # scope "/api", ContactManager do
  #   pipe_through :api
  # end
end
