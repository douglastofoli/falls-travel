defmodule FallsTravel.Carts.Actions.Delete do
  alias FallsTravel.Carts.Models.Cart
  alias FallsTravel.{Error, Repo}

  def call(id) do
    attrs = %{deleted_at: DateTime.utc_now()}

    case Get.call(id) do
      nil -> {:error, Error.build_cart_not_found_error()}
      _ -> Update.call(id, attrs)
    end
  end
end
