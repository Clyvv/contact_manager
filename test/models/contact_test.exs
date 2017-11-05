defmodule ContactManager.ContactTest do
  use ContactManager.ModelCase

  alias ContactManager.Contact

  @valid_attrs %{dob: "some dob", firstname: "some firstname", lastname: "some lastname", sex: "some sex"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Contact.changeset(%Contact{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Contact.changeset(%Contact{}, @invalid_attrs)
    refute changeset.valid?
  end
end
