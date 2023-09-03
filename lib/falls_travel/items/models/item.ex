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

  schema "items" do
    field(:name, :string)
    field(:description, :string)
    field(:type, Enum, values: @items_type)
    field(:price, :decimal)

    timestamps()
  end

  def changeset(item \\ %__MODULE__{}, attrs) do
    item
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
