defmodule ContactManager.User do
  use ContactManager.Web, :model

  schema "users" do
    field :fullname, :string
    field :email, :string
    field :password_hash, :string
    has_many :contacts, ContactManager.Contact
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:fullname, :email, :password_hash])
    |> validate_required([:fullname, :email, :password_hash])
  end
end
