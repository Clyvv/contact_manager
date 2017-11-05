defmodule ContactManager.Contact do
  use ContactManager.Web, :model

  schema "contacts" do
    field :firstname, :string
    field :lastname, :string
    field :sex, :string
    field :dob, :string
    
    has_one :titles, ContactManager.Title
    has_many :addresses, ContactManager.Address
    has_many :emails, ContactManager.Email
    has_many :phones, ContactManager.Phone
    belongs_to :contact, ContactManager.User, foreign_key: :user_id
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:firstname, :lastname, :sex, :dob])
    |> validate_required([:firstname, :lastname, :sex, :dob])
  end
end
