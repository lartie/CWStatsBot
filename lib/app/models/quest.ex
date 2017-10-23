defmodule App.Models.Quest do
  @moduledoc false

  use Ecto.Schema

  import Ecto.Changeset

  alias App.Models.User

  @types ~w(forest cave caravan unknown)

  @required_fields ~w(from_id message completed_at type)a

  @optional_fields ~w(exp gold)a

  schema "quests" do
    field :message
    field :completed_at, :naive_datetime
    field :type
    field :exp, :integer, default: 0
    field :gold, :integer, default: 0
    belongs_to :from, User

    timestamps()
  end

  def changeset(quest, params) do
    quest
    |> cast(params, @required_fields ++ @optional_fields)
    |> cast_assoc(:from)
    |> validate_required(@required_fields)
    |> validate_inclusion(:type, @types)
    |> validate_number(:exp, greater_than_or_equal_to: 0)
    |> validate_number(:gold, greater_than_or_equal_to: 0)
    |> assoc_constraint(:from)
    |> unique_constraint(:completed_at, name: :unique_quest_message_index)
  end
end