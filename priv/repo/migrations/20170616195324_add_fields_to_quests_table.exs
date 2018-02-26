defmodule App.Repo.Migrations.AddFieldsToQuestsTable do
  use Ecto.Migration

  def change do
    create unique_index(:quests, [:completed_at, :from_id], name: :unique_quest_message_index)

    alter table(:quests) do
      add :exp, :integer
      add :gold, :integer
      add :loot, {:array, :map}
    end
  end
end
