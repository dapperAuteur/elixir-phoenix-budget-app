# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :budget,
  ecto_repos: [Budget.Repo]

# Configures the endpoint
config :budget, Budget.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Ft+5nlaxxVSbNrEzKVYRllqpjklu0Ub2aGXnDvfXLUX5sPNyKT3xhPxG191vDEMT",
  render_errors: [view: Budget.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Budget.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
