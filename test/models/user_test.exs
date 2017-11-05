defmodule ContactManager.UserTest do
  use ContactManager.ModelCase

  alias ContactManager.User

  @valid_attrs %{email: "some email", fullname: "some fullname", password_hash: "some password_hash", username: "some username"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
