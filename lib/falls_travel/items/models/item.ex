defmodule FallsTravel.Items.Models.Item do
  use Ecto.Schema

  import Ecto.Changeset

  alias Ecto.Enum
  alias FallsTravel.Carts.Models.Cart
  alias FallsTravel.CartsItems.Models.CartItem

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_fields ~w(name description type price)a
  @optional_fields ~w()a

  @items_type ~w(product service)a

  @derive {Jason.Encoder, only: @required_fields ++ [:id]}

  schema "items" do
    field(:name, :string)
    field(:description, :string)
    field(:type, Enum, values: @items_type)
    field(:price, :decimal)

    many_to_many :carts, Cart, join_through: CartItem

    timestamps()
  end

  def changeset(item \\ %__MODULE__{}, attrs) do
    item
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
