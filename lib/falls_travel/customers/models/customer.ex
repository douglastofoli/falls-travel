defmodule FallsTravel.Customers.Models.Customer do
  use Ecto.Schema

  import Ecto.Changeset

  alias FallsTravel.Carts.Models.Cart

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_fields ~w(name)a
  @optional_fields ~w()a

  schema "customers" do
    field :name, :string

    has_many :carts, Cart

    timestamps()
  end

  def changeset(customer \\ %__MODULE__{}, attrs) do
    customer
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
