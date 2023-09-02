defmodule FallsTravel.Repo.Migrations.CreateShoppingCarts do
  use Ecto.Migration

  def up do
    execute "CREATE TYPE shopping_cart_status_type AS ENUM ('open', 'in_checkout', 'completed', 'empty', 'canceled')",
            ""

    create table(:shopping_carts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :status, :shopping_cart_status_type, null: false, default: "open"
      add :customer_id, references(:customers, type: :binary_id), null: false

      timestamps()
    end
  end

  def down do
    execute "", "DROP TYPE shopping_cart_status_type"

    drop table(:shopping_carts)
  end
end
