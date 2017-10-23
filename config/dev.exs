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
  database: "dev_cwstatsbot",
  username: "macbookpro",
  password: "",
  hostname: "localhost",
  port: "5432"

# Exq

config :exq,
  name: Exq,
  host: "127.0.0.1",
  port: 6379,
  namespace: "exq",
  concurrency: 40,
  queues: ["incoming_messages"],
  poll_timeout: 50,
  scheduler_poll_timeout: 1000,
  scheduler_enable: true,
  max_retries: 25,
  shutdown_timeout: 5000