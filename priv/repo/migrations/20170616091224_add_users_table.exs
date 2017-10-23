defmodule App.Repo.Migrations.AddUsersTable do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :integer, primary_key: true
      add :username, :string
      add :first_name, :string
      add :last_name, :string

      timestamps()
    end
  end
end
