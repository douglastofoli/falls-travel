defmodule FallsTravel.CartsItems.Models.CartItem do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  alias FallsTravel.Carts.Models.Cart
  alias FallsTravel.Items.Models.Item

  @primary_key false
  @foreign_key_type :binary_id

  @required_fields ~w(cart_id item_id quantity)a
  @optional_fields ~w()a

  schema "carts_items" do
    belongs_to(:cart, Cart)
    belongs_to(:item, Item)
  end

  def build(attrs) do
    attrs
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(carts \\ %__MODULE__{}, attrs) do
    carts
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> cast_assoc(:item, required: true)
    |> validate_required(@required_fields)
  end
end
