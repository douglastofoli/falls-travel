defmodule FallsTravel.Carts.Actions.TotalPriceTest do
  use FallsTravel.DataCase, async: true

  alias FallsTravel.Carts.Actions.{Create, TotalPrice}
  alias FallsTravel.Carts.Models.Cart
  alias FallsTravel.Factory

  describe "calculate/1" do
    test "when receive a cart with items, calculate the total_price" do
      customer = Factory.insert(:customer)
      cart = Factory.insert(:cart, customer_id: customer.id)
      items = Factory.insert_list(3, :item)

      items_ids = Enum.map(items, & &1.id)

      items_params = %{
        cart_id: cart.id,
        items: [
          %{item_id: Enum.at(items_ids, 0), quantity: 2},
          %{item_id: Enum.at(items_ids, 1), quantity: 2},
          %{item_id: Enum.at(items_ids, 2), quantity: 2}
        ]
      }

      {:ok, cart} = Create.add_item(items_params)

      assert %Cart{total_price: total_price} = TotalPrice.calculate(cart)
      assert %Decimal{} = total_price
    end

    test "when receive a cart with items, calculate the discount" do
      customer = Factory.insert(:customer)
      cart = Factory.insert(:cart, customer_id: customer.id)
      items = Factory.insert_list(3, :item)

      items_ids = Enum.map(items, & &1.id)

      items_params = %{
        cart_id: cart.id,
        items: [
          %{item_id: Enum.at(items_ids, 0), quantity: 2},
          %{item_id: Enum.at(items_ids, 1), quantity: 2},
          %{item_id: Enum.at(items_ids, 2), quantity: 2}
        ]
      }

      {:ok, cart} = Create.add_item(items_params)

      assert %Cart{total_price_with_discount: total_price_with_discount} =
               TotalPrice.apply_discount(cart)

      assert %Decimal{} = total_price_with_discount
    end
  end
end
