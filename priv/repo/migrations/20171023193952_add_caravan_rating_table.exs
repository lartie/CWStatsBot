defmodule App.Repo.Migrations.AddCaravanRatingTable do
  use Ecto.Migration

  def change do
    create table(:caravan_rating) do
      add :username, :string
      add :rating, :integer, default: 0

      timestamps()
    end
  end
end
