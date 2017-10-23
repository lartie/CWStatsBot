defmodule App.Commands.Help do
  @moduledoc false

  use App.Commander


  def help(update) do
    Logger.log :info, "User #{inspect update.message.chat.id} show help."

    send_message "Я просто собираю статистику по походам в пещеру или лес, чего ты ещё от меня хочешь? А ещё я могу принять информацию о твоём классе /class@ChatWarsBot."
  end
  
end