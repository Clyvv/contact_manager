defmodule ContactManager.Email do
  use ContactManager.Web, :model

  schema "emails" do
    field :address, :string
    belongs_to :contact, ContactManager.Contact, foreign_key: :contact_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:address])
    |> validate_required([:address])
    |> assoc_constraint(:contact)
  end
end
