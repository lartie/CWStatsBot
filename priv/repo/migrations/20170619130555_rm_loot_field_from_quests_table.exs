defmodule App.Repo.Migrations.RmLootFieldFromQuestsTable do
  use Ecto.Migration

  def change do
    alter table(:quests) do
      remove :loot
    end
  end
end
