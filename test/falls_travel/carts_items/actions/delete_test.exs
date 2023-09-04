defmodule FallsTravel.CartsItems.Actions.DeleteTest do
  use FallsTravel.DataCase, async: true

  alias FallsTravel.Carts.Models.Cart
  alias FallsTravel.CartsItems.Actions.Delete
  alias FallsTravel.Error
  alias FallsTravel.Factory

  describe "call/1" do
    test "when cart and items are found, then remove it from cart" do
      customer = Factory.insert(:customer)
      cart = Factory.insert(:cart, customer_id: customer.id)
      item = Factory.insert(:item)
      Factory.insert(:cart_item, cart_id: cart.id, item_id: item.id)

      response = Delete.call(cart.id, [item.id])

      assert {:ok, %Cart{}} = response
    end

    test "when cart is not found, then return an error" do
      customer = Factory.insert(:customer)
      cart = Factory.insert(:cart, customer_id: customer.id)
      item = Factory.insert(:item)
      Factory.insert(:cart_item, cart_id: cart.id, item_id: item.id)

      response = Delete.call(Ecto.UUID.generate(), [item.id])

      assert {:error, %Error{}} = response
    end
  end
end
