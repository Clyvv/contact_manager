defmodule ContactManager.EmailTest do
  use ContactManager.ModelCase

  alias ContactManager.Email

  @valid_attrs %{address: "some address"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Email.changeset(%Email{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Email.changeset(%Email{}, @invalid_attrs)
    refute changeset.valid?
  end
end
