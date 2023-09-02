defmodule JustGravel.Repo.Migrations.AddCustomersTable do
  use Ecto.Migration

  def up do
    create table(:customers, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string

      timestamps()
    end

    create unique_index(:customers, [:name])
  end

  def down do
    drop table(:customers)
  end
end
