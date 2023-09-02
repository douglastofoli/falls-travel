defmodule FallsTravel.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def up do
    execute "CREATE TYPE items_type AS ENUM ('product', 'service')", ""

    create table(:items, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, null: false
      add :description, :string, null: false
      add :type, :items_type, null: false
      add :price, :decimal, null: false

      timestamps()
    end

    create unique_index(:items, [:name])
  end

  def down do
    execute "", "DROP TYPE items_type"

    drop table(:items)
  end
end
