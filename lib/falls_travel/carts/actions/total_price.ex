defmodule FallsTravel.Carts.Actions.TotalPrice do
  alias FallsTravel.Carts.Models.Cart
  alias FallsTravel.Items.Models.Item

  def calculate(%Cart{items: items} = cart) do
    total_price = Enum.reduce(items, Decimal.new("0.00"), &sum_prices(&1, &2))

    %Cart{cart | total_price: total_price}
  end

  def apply_discount(%Cart{total_price: total_price} = cart) do
    discount = Decimal.new("0.10")
    discount_price = Decimal.mult(total_price, discount)
    total_price = Decimal.sub(total_price, discount_price)

    %Cart{cart | total_price_with_discount: total_price}
  end

  def apply_discount(%Cart{} = cart, %{payment_in_cash: false}), do: cart

  defp sum_prices(%Item{price: price}, acc), do: Decimal.add(price, acc)
end
