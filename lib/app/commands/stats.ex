defmodule App.Commands.Stats do
  @moduledoc false

  use App.Commander

  alias App.Repo
  alias App.Models.User

  import Ecto.Query

  def stats(update) do
    chat_id = update.message.chat.id
    user = Repo.get(User, chat_id)

    if user === nil do
      App.Commands.Start.start(update)
    else
      query = from q in "quests", where: q.from_id == ^chat_id, select: {count(q.id), sum(q.exp), sum(q.gold)}
      {num, exp, gold} = Repo.one(query)

      send_message "Всего походов: #{num}\nВсего опыта: #{exp}\nВсего золота: #{gold}"
    end
  end
end
