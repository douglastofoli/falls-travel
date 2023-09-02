defmodule JustGravel.Repo.Migrations.AddShoppingCartsTable do
  use Ecto.Migration

  def up do
    create table(:shopping_carts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :customer_id, references(:customers, type: :binary_id)
      add :product_id, references(:products, type: :binary_id)
      add :quantity, :integer

      timestamps()
    end
  end

  def down do
    drop table(:shopping_carts)
  end
end
