defmodule App.CommandsWorker do
  require Logger
  alias App.Commands

  def perform(list) do

    list
    |> :erlang.list_to_binary
    |> :erlang.binary_to_term
    |> Commands.match_message
  end
end