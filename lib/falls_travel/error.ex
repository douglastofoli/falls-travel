defmodule FallsTravel.Error do
  @moduledoc """
  Return struct with error
  """

  @keys [:status, :result]

  @enforce_keys @keys

  defstruct @keys

  def build(status, result) do
    %__MODULE__{status: status, result: result}
  end

  def build_bad_request_error, do: build(:bad_request, "Bad request")
  def build_cart_not_found_error, do: build(:not_found, "Cart not found")
  def build_customer_not_found_error, do: build(:not_found, "Customer not found")
  def build_item_not_found_error, do: build(:not_found, "Item not found")
end
