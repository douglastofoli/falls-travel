defmodule FallsTravel.Repo.Migrations.CreateCarts do
  use Ecto.Migration

  def up do
    execute "CREATE TYPE cart_status_type AS ENUM ('open', 'in_checkout', 'completed', 'empty', 'canceled')",
            ""

    create table(:carts, primary_key: false) do
      add :id, :binary_id, primary_key: true, default: fragment("gen_random_uuid()")
      add :status, :cart_status_type, null: false, default: "open"
      add :customer_id, references(:customers, type: :binary_id), null: false

      add :deleted_at, :utc_datetime

      timestamps()
    end
  end

  def down do
    execute "", "DROP TYPE cart_status_type"

    drop table(:carts)
  end
end
