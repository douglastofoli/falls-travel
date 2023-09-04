defmodule FallsTravel.Carts.Models.CartTest do
  use FallsTravel.DataCase, async: true

  alias Ecto.Changeset
  alias FallsTravel.Carts.Models.Cart
  alias FallsTravel.Factory

  describe "changeset/3" do
    test "when all params are valid, returns a valid changeset" do
      item = Factory.insert(:item)
      params = Factory.build(:cart_params)

      response = Cart.changeset(params, [item])

      assert %Changeset{valid?: true} = response
    end
  end
end
