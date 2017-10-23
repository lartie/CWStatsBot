defmodule App.Models.User do
  @moduledoc false

  use Ecto.Schema

  import Ecto.Changeset

  alias App.Models.Quest

  @primary_key {:id, :integer, autogenerate: false}

  @required_fields ~w(id)a

  @optional_fields ~w(username first_name last_name class)a

  @classes ~w(Эсквайр Рыцарь Страж Хранитель Паладин Мастер Кузнец Добытчик)

  schema "users" do
    field :username
    field :first_name
    field :last_name
    field :class
    field :lvl, :integer, default: 0
    has_many :quests, Quest, foreign_key: :from_id

    timestamps()
  end

  def changeset(user, params) do
    user
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> validate_inclusion(:class, @classes)
    |> validate_number(:lvl, greater_than: 0)
  end
end