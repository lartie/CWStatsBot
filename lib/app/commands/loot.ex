defmodule App.Commands.Loot do
  @moduledoc false

  use App.Commander

  import Ecto.Query

  alias App.Models.{QuestLoot, Quest}
  alias App.Repo

  def handle(update) do
    uid = update.message.chat.id
    quests = Repo.all(from qu in Quest, where: qu.from_id == ^uid, select: qu.id)

    from(q in QuestLoot,
            where: q.quest_id in ^quests,
            join: resource in assoc(q, :resource),
            group_by: resource.id,
            order_by: [asc: resource.id],
            select: {resource.name, sum(q.number)})
    |> Repo.all
    |> Enum.sort(fn ({n1, _}, {n2, _}) -> n2 >= n1 end)
    |> Enum.reduce("", fn ({name, number}, acc) -> acc <> "#{name}: #{number}\n" end)
    |> send_message
  end
end
