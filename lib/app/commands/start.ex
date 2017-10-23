defmodule App.Commands.Start do
  @moduledoc false

  use App.Commander
  alias App.Models.User
  alias App.Repo

  def start(update) do
    chat = update.message.chat

    user = Repo.get(User, chat.id)

    if user === nil do
      changeset = User.changeset(%User{}, %{id: chat.id, username: chat.username, first_name: chat.first_name, last_name: chat.last_name})

      if changeset.valid? do
        case Repo.insert(changeset) do
          {:ok, _} ->
            send_message "Здравствуй, клубок. Проходи, не задерживайся, но оставь мне доказательства что ты был в лесу. А ещё я могу принять информацию о твоём классе /class@ChatWarsBot."
          {:error, _} ->
            send_message "Вы меня с кем-то путаете."
        end
      else
        send_message "Эй, ты чего творишь?"
      end
    else
      send_message "Молодой человек, у меня обед. /help"
    end
  end
end