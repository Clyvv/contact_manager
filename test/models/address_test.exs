defmodule ContactManager.AddressTest do
  use ContactManager.ModelCase

  alias ContactManager.Address

  @valid_attrs %{city: "some city", country: "some country", street: "some street", zip: "some zip"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Address.changeset(%Address{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Address.changeset(%Address{}, @invalid_attrs)
    refute changeset.valid?
  end
end
