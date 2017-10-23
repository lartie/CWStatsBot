defmodule App.Commands do
  use App.Router
  use App.Commander

  command "start", App.Commands.Start, :start
  command "help", App.Commands.Help, :help
  command "stats", App.Commands.Stats, :stats

  command "priv_stats", App.Commands.Admin, :priv_stats
  command "priv_users", App.Commands.Admin, :priv_users
  command "priv_loot", App.Commands.Admin, :priv_loot

  command "loot", App.Commands.Loot, :handle

  message App.Commands.Parser, :parser
end
