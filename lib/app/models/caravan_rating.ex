defmodule CaravanRating do
  @moduledoc false

  use Ecto.Schema

  import Ecto.Changeset

  @required_fields ~w(username)a

  @optional_fields ~w()a

  schema "caravan_rating" do
    field :username
    field :rating, :integer, default: 0

    timestamps()
  end

  def changeset(caravan_rating, params) do
    caravan_rating
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> validate_number(:rating)
  end

  def changeset_increment(caravan_rating) do

  end

  def changeset_decrement(caravan_rating) do

  end
end
