defmodule App.Commands.Admin do
  @moduledoc false

  use App.Commander

  @admin 36983349

  alias App.Repo
  alias App.Models.{User, QuestLoot}
  alias App.Commands.Start

  import Ecto.Query

  def priv_stats(update) do

    if admin?(update.message.chat.id) do
      query = from q in "quests", where: true, select: {count(q.id), sum(q.exp), sum(q.gold)}
      {num, exp, gold} = Repo.one(query)

      send_message "Всего походов: #{num}\nВсего опыта: #{exp}\nВсего золота: #{gold}"
    else
      Start.start(update)
    end
  end

  def priv_users(update) do
    if admin?(update.message.chat.id) do
      User
      |> Repo.all
      |> Enum.sort(fn (u1, u2) -> u1.lvl <= u2.lvl end)
      |> Enum.reduce("", fn (user, resp) -> resp <> "#{user.lvl} | #{user.class} | @#{user.username} \n" end)
      |> send_message
    else
      Start.start(update)
    end
  end

  def priv_loot(update) do
    if admin?(update.message.chat.id) do
      from(q in QuestLoot,
              join: resource in assoc(q, :resource),
              group_by: resource.id,
              order_by: [asc: resource.id],
              select: {resource.name, sum(q.number)})
      |> Repo.all
      |> Enum.sort(fn ({n1, _}, {n2, _}) -> n2 >= n1 end)
      |> Enum.reduce("", fn ({name, number}, acc) -> acc <> "#{name}: #{number}\n" end)
      |> send_message
    else
      Start.start(update)
    end
  end

  defp admin?(uid), do: uid == @admin
end
