defmodule FallsTravelWeb.Resolvers.Carts do
  alias FallsTravel.Carts.Actions.{Create, Get}

  def find(_parent, %{cart_id: cart_id, payment_in_cash: payment_in_cash} = attrs, _resolution) do
    Get.call(attrs)
  end

  def add_item(_parent, %{cart_id: _cart_id} = attrs, _resolution) do
    case Create.add_item(attrs) do
      {:ok, carts} -> {:ok, carts}
      {:error, changeset} -> {:error, changeset}
    end
  end
end
