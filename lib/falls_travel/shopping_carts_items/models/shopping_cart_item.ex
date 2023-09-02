defmodule FallsTravel.ShoppingCartsItems.Models.ShoppingCartItem do
  use Ecto.Schema
  import Ecto.Changeset

  alias FallsTravel.Items.Models.Item
  alias FallsTravel.ShoppingCarts.Models.ShoppingCart

  @required_fields ~w(shopping_cart_id item_id quantity)a
  @optional_fields ~w()a

  schema "shopping_carts_items" do
    field :quantity, :integer

    belongs_to :item, Item
    belongs_to :shopping_cart, ShoppingCart
  end

  def changeset(shopping_cart \\ %__MODULE__{}, attrs) do
    shopping_cart
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> unique_constraint(:customer_id)
  end
end
