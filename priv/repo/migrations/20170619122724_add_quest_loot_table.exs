defmodule App.Repo.Migrations.AddQuestLootTable do
  use Ecto.Migration

  def change do
    create table(:quest_loot) do
      add :quest_id, references(:quests)
      add :resource_id, references(:resources)
      add :number, :integer

      timestamps()
    end

    create unique_index(:quest_loot, [:quest_id, :resource_id], name: :unique_quest_resource_index)
  end
end
