defmodule FallsTravel.Repo.Migrations.CreateCustomers do
  use Ecto.Migration

  def up do
    create table(:customers, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, null: false

      timestamps()
    end

    create unique_index(:customers, [:name])
  end

  def down do
    drop table(:customers)
  end
end
