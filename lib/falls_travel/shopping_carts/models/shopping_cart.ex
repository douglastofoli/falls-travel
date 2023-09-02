defmodule FallsTravel.ShoppingCarts.Models.ShoppingCart do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecto.Enum
  alias FallsTravel.Customers.Models.Customer
  alias FallsTravel.Items.Models.Item
  alias FallsTravel.ShoppingCartsItems.Models.ShoppingCartItem

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_fields ~w(status customer_id)a
  @optional_fields ~w()a

  @shopping_cart_status_type ~w(open in_checkout completed empty canceled)a

  schema "shopping_carts" do
    field :status, Enum, values: @shopping_cart_status_type

    belongs_to :customer, Customer
    many_to_many :items, Item, join_through: ShoppingCartItem

    timestamps()
  end

  def changeset(shopping_cart \\ %__MODULE__{}, attrs) do
    shopping_cart
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> unique_constraint(:customer_id)
    |> put_assoc(:items, attrs[:items])
  end
end
