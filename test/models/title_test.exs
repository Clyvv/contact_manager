defmodule ContactManager.TitleTest do
  use ContactManager.ModelCase

  alias ContactManager.Title

  @valid_attrs %{title: "some title"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Title.changeset(%Title{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Title.changeset(%Title{}, @invalid_attrs)
    refute changeset.valid?
  end
end
