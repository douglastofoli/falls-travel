defmodule JustGravel.Repo.Migrations.AddProductsTable do
  use Ecto.Migration

  def up do
    create table(:products, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :description, :string
      add :price, :decimal

      timestamps()
    end

    create unique_index(:products, [:name])
  end

  def down do
    drop table(:products)
  end
end
