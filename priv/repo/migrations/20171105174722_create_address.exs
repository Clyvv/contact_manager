defmodule ContactManager.Repo.Migrations.CreateAddress do
  use Ecto.Migration

  def change do
    create table(:addresses) do
      add :street, :string
      add :zip, :string
      add :city, :string
      add :country, :string
      add :contact_id, references(:contacts, on_delete: :nothing)

      timestamps()
    end
  end
end
