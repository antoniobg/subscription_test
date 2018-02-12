defmodule SubscriptionTestWeb.Router do
  use SubscriptionTestWeb, :router

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

  scope "/", SubscriptionTestWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api" do
    forward "/",
      Absinthe.Plug,
      schema: SubscriptionTestWeb.Schema
  end


  forward "/graphiql",
    Absinthe.Plug.GraphiQL,
    schema: SubscriptionTestWeb.Schema

  # Other scopes may use custom stacks.
  # scope "/api", SubscriptionTestWeb do
  #   pipe_through :api
  # end
end
