defmodule ContactManager.Repo.Migrations.CreateTitle do
  use Ecto.Migration

  def change do
    create table(:titles) do
      add :title, :string, null: false

      timestamps()
    end
    create unique_index(:titles, [:title])
  end
end
