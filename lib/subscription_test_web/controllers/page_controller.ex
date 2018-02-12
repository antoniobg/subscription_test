defmodule SubscriptionTestWeb.PageController do
  use SubscriptionTestWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
