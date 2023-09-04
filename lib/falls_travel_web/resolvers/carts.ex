defmodule FallsTravelWeb.Resolvers.Carts do
  alias FallsTravel.Carts.Actions.{Create, Delete, Get}

  def all(_parent, _args, _resolution) do
    Get.all()
  end

  def find(_parent, %{cart_id: cart_id}, _resolution) do
    Get.call(cart_id)
  end

  def add_item(_parent, %{cart_id: _cart_id} = attrs, _resolution) do
    case Create.add_item(attrs) do
      {:ok, carts} -> {:ok, carts}
      {:error, changeset} -> {:error, changeset}
    end
  end

  def delete_cart(_parent, %{cart_id: cart_id}, _resolution) do
    Delete.call(cart_id)
  end
end
