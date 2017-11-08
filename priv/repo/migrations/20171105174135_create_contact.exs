defmodule ContactManager.Repo.Migrations.CreateContact do
  use Ecto.Migration

  def change do
    create table(:contacts) do
      add :firstname, :string
      add :lastname, :string
      add :sex, :string
      add :dob, :string
      add :title_id, references(:titles, on_delete: :nothing), null: false
      add :user_id, references(:users, on_delete: :delete_all), null: false
      timestamps()
    end
  end
end
