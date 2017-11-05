defmodule ContactManager.PhoneTest do
  use ContactManager.ModelCase

  alias ContactManager.Phone

  @valid_attrs %{address: "some address"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Phone.changeset(%Phone{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Phone.changeset(%Phone{}, @invalid_attrs)
    refute changeset.valid?
  end
end
