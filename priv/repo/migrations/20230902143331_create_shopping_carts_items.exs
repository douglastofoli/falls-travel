defmodule FallsTravel.Repo.Migrations.CreateShoppingCartItems do
  use Ecto.Migration

  def up do
    create table(:shopping_carts_items, primary_key: false) do
      add :shopping_cart_id, references(:shopping_carts, type: :binary_id), null: false
      add :item_id, references(:items, type: :binary_id), null: false
      add :quantity, :integer, null: false, default: 1
    end
  end

  def down do
    drop table(:shopping_cart_items)
  end
end
