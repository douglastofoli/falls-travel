defmodule FallsTravel.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def up do
    execute "CREATE TYPE items_type AS ENUM ('product', 'service')", ""

    create table(:items, primary_key: false) do
      add :id, :binary_id, primary_key: true, default: fragment("gen_random_uuid()")
      add :name, :string, null: false
      add :description, :string, null: false
      add :type, :items_type, null: false
      add :price, :decimal, null: false

      add :deleted_at, :utc_datetime

      timestamps()
    end
  end

  def down do
    execute "", "DROP TYPE items_type"

    drop table(:items)
  end
end
