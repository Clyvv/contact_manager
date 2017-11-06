defmodule ContactManager.Address do
  use ContactManager.Web, :model

  schema "addresses" do
    field :street, :string
    field :zip, :string
    field :city, :string
    field :country, :string
    belongs_to :contact, ContactManager.Contact, foreign_key: :contact_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:street, :zip, :city, :country])
    |> validate_required([:street, :city, :country])
    |> assoc_constraint(:contact)
  end
end
