defmodule FallsTravel.Carts.Actions.ValidateAndMultiplyItemsTest do
  use FallsTravel.DataCase, async: true

  alias FallsTravel.Carts.Actions.ValidateAndMultiplyItems
  alias FallsTravel.Carts.Models.Cart
  alias FallsTravel.Factory

  describe "call/3" do
    test "when all params are valid, multiply the items" do
      customer = Factory.insert(:customer)
      cart = Factory.insert(:cart, customer_id: customer.id)
      items = Factory.insert_list(3, :item)
      items_ids = Enum.map(items, & &1.id)

      items_params = [
        %{cart_id: cart.id, item_id: Enum.at(items_ids, 0), quantity: 2},
        %{cart_id: cart.id, item_id: Enum.at(items_ids, 1), quantity: 2},
        %{cart_id: cart.id, item_id: Enum.at(items_ids, 2), quantity: 2}
      ]

      {:ok, response} = ValidateAndMultiplyItems.call(items, items_ids, items_params)

      assert length(response) == 6
    end
  end
end
