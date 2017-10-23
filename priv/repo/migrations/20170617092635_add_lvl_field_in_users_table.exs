defmodule App.Repo.Migrations.AddLvlFieldInUsersTable do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :lvl, :integer
    end
  end
end
