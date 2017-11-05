defmodule ContactManager.Repo.Migrations.CreateEmail do
  use Ecto.Migration

  def change do
    create table(:emails) do
      add :address, :string
      add :contact_id, references(:contacts, on_delete: :nothing)

      timestamps()
    end

    create index(:emails, [:address])
  end
end
