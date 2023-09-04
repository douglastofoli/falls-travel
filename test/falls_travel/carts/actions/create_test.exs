defmodule FallsTravel.Carts.Actions.CreateTest do
  use FallsTravel.DataCase, async: true

  alias FallsTravel.Carts.Actions.Create
  alias FallsTravel.Carts.Models.Cart
  alias FallsTravel.Error
  alias FallsTravel.Factory
  alias FallsTravel.Items.Models.Item

  describe "call/1" do
    test "when all params are valid, insert the cart in database" do
      customer = Factory.insert(:customer)
      params = Factory.build(:cart_params, customer_id: customer.id)

      response = Create.call(params)

      assert {:ok, %Cart{}} = response
    end

    test "when required field is nil, returns an error" do
      customer = Factory.insert(:customer)
      params = Factory.build(:cart_params, customer_id: customer.id, status: nil)

      response = Create.call(params)

      assert {:error, %Error{}} = response
    end
  end

  describe "add_item/1" do
    test "when all params are valid, add a new item into the cart" do
      customer = Factory.insert(:customer)
      cart = Factory.insert(:cart, customer_id: customer.id)
      item = Factory.insert(:item)

      params =
        Factory.build(:cart_item_params,
          cart_id: cart.id,
          items: [%{item_id: item.id, quantity: 1}]
        )

      response = Create.add_item(params)

      assert {:ok, %Cart{items: items}} = response
      assert [%Item{}] = items
    end
  end
end
