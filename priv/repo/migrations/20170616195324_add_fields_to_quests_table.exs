defmodule App.Repo.Migrations.AddFieldsToQuestsTable do
  use Ecto.Migration

  def change do
    alter table(:quests) do
      add :exp, :integer
      add :gold, :integer
      add :loot, {:array, :map}
    end
  end
end
