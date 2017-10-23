defmodule QuestTest do
  use ExUnit.Case, async: true

  doctest App.Models.Quest

  @valid_attrs %{message: "В лесу ты отдохнул от бесконечных битв и просто набрал грибов и ягод. В замок вернулся уставший, но довольный.", completed_at: ~N[2017-06-19 14:00:07], type: "forest"}
  @invalid_attrs %{}

  alias App.Models.{User, Quest}
  alias App.Repo

  test "changeset with valid attributes" do

    user_changeset = User.changeset(%User{}, %{id: 1, username: "exunitcase"})
    assert user_changeset.valid?

    {:ok, user} = Repo.insert(user_changeset)

    valid_attrs = @valid_attrs |> Map.put(:from_id, user.id)

    quest_changeset = Quest.changeset(%Quest{}, valid_attrs)
    assert quest_changeset.valid?

    {:ok, _} = Repo.delete user
  end

  test "changeset with invalid attributes" do
    changeset = Quest.changeset(%Quest{}, @invalid_attrs)
    refute changeset.valid?
  end
end