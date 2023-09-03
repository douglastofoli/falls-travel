defmodule FallsTravel.Repo.Migrations.CreateCartItems do
  use Ecto.Migration

  def up do
    create table(:carts_items, primary_key: false) do
      add :cart_id, references(:carts, type: :binary_id), primary_key: true
      add :item_id, references(:items, type: :binary_id), primary_key: true
      add :quantity, :integer, default: 1
    end
  end

  def down do
    drop table(:cart_items)
  end
end
