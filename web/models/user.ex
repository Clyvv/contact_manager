defmodule ContactManager.User do
  use ContactManager.Web, :model

  schema "users" do
    field :fullname, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :is_admin, :boolean
    #has_many :contacts, ContactManager.Contact
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:fullname, :email, :password, :is_admin])
    |> validate_required([:fullname, :email, :password])
    |> hash_password
  end

  def update_changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:fullname, :email, :is_admin])
    |> validate_required([:fullname, :email])
  end

  def hash_password(changeset) do
    if changeset.valid? do
      put_change(changeset, :password_hash, Comeonin.Pbkdf2.hashpwsalt(changeset.changes.password))
    else
      changeset
    end
  end
end
