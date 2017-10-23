defmodule App.Repo.Migrations.AddResourcesTable do
  use Ecto.Migration

  def change do
    create table(:resources) do
      add :name, :string
      add :weight, :integer
      add :aliases, {:array, :string}

      timestamps()
    end

    create unique_index(:resources, [:name], name: :unique_resource_name_index)
  end
end
