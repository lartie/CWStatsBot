defmodule App.Repo.Migrations.AddFieldsToQuestsTable do
  use Ecto.Migration

  def change do
    create unique_index(:quests, [:completed_at, :from_id], name: :unique_quest_message_index)
  end
end
