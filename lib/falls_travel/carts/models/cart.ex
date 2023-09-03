defmodule FallsTravel.Carts.Models.Cart do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecto.Enum
  alias FallsTravel.CartsItems.Models.CartItem
  alias FallsTravel.Customers.Models.Customer
  alias FallsTravel.Items.Models.Item

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_fields ~w(status customer_id)a
  @optional_fields ~w()a

  @cart_status_type ~w(open in_checkout completed empty canceled)a

  schema "carts" do
    field(:status, Enum, values: @cart_status_type)

    belongs_to(:customer, Customer)
    has_many(:carts_items, CartItem)
    has_many(:items, through: [:carts_items, :item])

    timestamps()
  end

  def build(attrs) do
    attrs
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(cart \\ %__MODULE__{}, attrs) do
    cart
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> cast_assoc(:carts_items, required: true, with: &CartItem.changeset/2)
    |> validate_required(@required_fields)
  end
end
