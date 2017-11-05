# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :contact_manager,
  ecto_repos: [ContactManager.Repo]

# Configures the endpoint
config :contact_manager, ContactManager.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pqxlnnNQOrgN69Lh4he5/1YlXb9OV9UdPXWC9JClOpXhNdFbNGZKoHKbj7FIVODM",
  render_errors: [view: ContactManager.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ContactManager.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
