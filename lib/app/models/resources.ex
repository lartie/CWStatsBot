defmodule App.Models.Resources do
  @moduledoc false

  use Ecto.Schema

  import Ecto.Changeset

  @required_fields ~w(name)a

  @optional_fields ~w(weight aliases)a

  schema "resources" do
    field :name
    field :weight, :integer, default: 0
    field :aliases, {:array, :string}, default: []

    timestamps()
  end

  def changeset(resource, params) do
    resource
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> validate_number(:weight, greater_than_or_equal_to: 0)
    |> unique_constraint(:name, name: :unique_resource_name_index)
  end
end