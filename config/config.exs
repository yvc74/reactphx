# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :gw,
  ecto_repos: [GW.Repo]

# Configures the endpoint
config :gw, GW.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "iMBRQs6YpxPH0r0MGShDollz2J6hB8iJGiAB+LvCPDGL6Yh0tVB6SX21phbr9EUw",
  render_errors: [view: GW.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: GW.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

  # Configure Guardian
config :guardian, Guardian,
  issuer: "GW",
  ttl: { 3, :days },
  verify_issuer: true, # optional
  secret_key: "F4Udhc6ck6MKKjYXqvYnt2MvVwpcqd5oKMYQRaBTfDr5byEhkv615+LrEQ/NB0u2",
  serializer: GW.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
