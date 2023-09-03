defmodule FallsTravel.Repo.Migrations.CreateCustomers do
  use Ecto.Migration

  def up do
    create table(:customers, primary_key: false) do
      add :id, :binary_id, primary_key: true, default: fragment("gen_random_uuid()")
      add :name, :string, null: false

      add :deleted_at, :utc_datetime

      timestamps()
    end
  end

  def down do
    drop table(:customers)
  end
end
