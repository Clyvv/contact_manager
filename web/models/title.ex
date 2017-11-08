defmodule ContactManager.Title do
  use ContactManager.Web, :model

  schema "titles" do
    field :title, :string

    has_many :contacts, ContactManager.Contact
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> validate_required([:title])
  end
end
