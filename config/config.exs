# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :subscription_test,
  ecto_repos: [SubscriptionTest.Repo]

# Configures the endpoint
config :subscription_test, SubscriptionTestWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "GtU2JEFrV2DAZ3zbEFlJfwTOWTb5Ou0a/LkLIHjcch2KwHeYz99hoZNvM7dto9jt",
  render_errors: [view: SubscriptionTestWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SubscriptionTest.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
