defmodule FallsTravel.Customers.Models.Customer do
  use Ecto.Schema

  import Ecto.Changeset

  alias FallsTravel.ShoppingCarts.Models.ShoppingCart

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_fields ~w(name)a
  @optional_fields ~w()a

  schema "customers" do
    field :name, :string

    has_many :shopping_carts, ShoppingCart

    timestamps()
  end

  def changeset(customer \\ %__MODULE__{}, attrs) do
    IO.inspect(attrs)

    customer
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> unique_constraint(:name)
  end
end
