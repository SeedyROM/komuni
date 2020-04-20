# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :komuni,
  ecto_repos: [Komuni.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :komuni, KomuniWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "f0o6cjctl1XuEli8UKQV2Ye1oGxg9ldE4G/F5R5g8b+OE8KKsPU3+Ltj4ThWs1JY",
  render_errors: [view: KomuniWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Komuni.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "CyvZCBz1"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :komuni, :pow,
  user: Komuni.Users.User,
  repo: Komuni.Repo

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
