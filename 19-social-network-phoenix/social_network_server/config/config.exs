# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :social_network_server,
  ecto_repos: [SocialNetworkServer.Repo]

# Configures the endpoint
config :social_network_server, SocialNetworkServerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Xrd7XNCUkNZCft5IoOKZtakj2rET5VHMzsAmPTkvBvvAOjRObHeqAAKIve8M4y/n",
  render_errors: [view: SocialNetworkServerWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: SocialNetworkServer.PubSub,
  live_view: [signing_salt: "oiLnKzRW"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
