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

  @derive {Jason.Encoder, only: @required_fields ++ [:id, :items, :total_price]}

  schema "carts" do
    field(:status, Enum, values: @cart_status_type)
    field :total_price, :decimal, default: 0.0, virtual: true

    belongs_to(:customer, Customer)
    many_to_many :items, Item, join_through: CartItem

    timestamps()
  end

  def changeset(cart \\ %__MODULE__{}, attrs, items) do
    cart
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> IO.inspect()
    |> validate_required(@required_fields)
    |> put_assoc(:items, items)
  end
end
