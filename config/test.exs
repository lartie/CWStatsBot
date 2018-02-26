use Mix.Config

# Telegram settings

config :app,
  bot_name: "CWStatsBot"

config :nadia,
  token: "398800322:AAFlPDSI9hAkHbnLboJixQ-O250iSt3mgH0"

# Database settings

config :app,
  ecto_repos: [App.Repo]

config :app, App.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "cwstats",
  username: "cwstats",
  password: "secret",
  hostname: "postgres",
  port: "5432"

# Exq

config :exq,
  name: Exq,
  host: "redis",
  port: 6379,
  namespace: "exq",
  concurrency: 40,
  queues: ["test_incoming_messages"],
  poll_timeout: 50,
  scheduler_poll_timeout: 1000,
  scheduler_enable: true,
  max_retries: 25,
  shutdown_timeout: 5000