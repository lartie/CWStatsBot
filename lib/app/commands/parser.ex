defmodule App.Commands.Parser do
  @moduledoc false

  use App.Commander
  alias App.Repo
  alias App.Models.User
  require Logger

  @cwbotid 265204902

  @doc """
  Обработка входящих сообщений которые не подходят ни под одну команду
  """
  def parser(update) do
    user = Repo.get(User, update.message.chat.id)

    if user === nil do
      App.Commands.Start.start(update)
    else
      if (update.message.forward_from !== nil and update.message.forward_from.id === @cwbotid and update.message.text !== nil) do
        send_message execute(update.message)
      else
        send_message "Не балуйся! Лучше форвардни мне пару походов в пещеру, пока лесник не видит."
      end
    end
  end

  defp execute(message) do
    cond do
      App.Commands.ParseQuest.quest_message?(message.text) ->
        App.Commands.ParseQuest.handle(message)
      App.Commands.ParseClass.class_message?(message.text) ->
        App.Commands.ParseClass.handle(message)
      true ->
        "Не понимаю что ты от меня хочешь. Я принимаю только сообщения из леса, пещеры и информацию о классе /class@ChatWarsBot"
    end
  end
end