defmodule UserTest do
  use ExUnit.Case, async: true

  doctest App.Models.User

  @valid_attrs %{id: 1, username: "exunitcase"}
  @invalid_attrs %{}

  alias App.Models.User

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end