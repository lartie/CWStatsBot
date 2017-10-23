defmodule App.Repo.Migrations.AddQuestsTable do
  use Ecto.Migration

  def change do
    create table(:quests) do
      add :completed_at, :naive_datetime, null: false
      add :message, :text
      add :type, :string
      add :from_id, references(:users)

      timestamps()
    end
  end
end
