defmodule App.Models.QuestLoot do
  @moduledoc false

  use Ecto.Schema

  import Ecto.Changeset

  alias App.Models.{Quest, Resources}

  @required_fields ~w(number quest_id resource_id)a

  schema "quest_loot" do
    field :number, :integer
    belongs_to :quest, Quest
    belongs_to :resource, Resources

    timestamps()
  end

  def changeset(quest_loot, params) do
    quest_loot
    |> cast(params, @required_fields)
    |> cast_assoc(:quest)
    |> cast_assoc(:resource)
    |> validate_required(@required_fields)
    |> validate_number(:number, greater_than: 0)
    |> assoc_constraint(:quest)
    |> assoc_constraint(:resource)
    |> unique_constraint(:quest_id, name: :unique_quest_resource_index)
  end
end