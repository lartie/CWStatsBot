defmodule App.Repo.Migrations.AddClassFieldInUsersTable do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :class, :string
    end
  end
end
