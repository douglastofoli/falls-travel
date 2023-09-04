defmodule FallsTravelWeb.Schema.Customers.CustomerTypes do
  @moduledoc """
  Customer types.
  """

  use Absinthe.Schema.Notation

  @desc "A customer of the application"
  object :customer do
    field(:id, :id)
    field(:name, :string)
  end

  @desc "A customer input"
  input_object :customer_input do
    field(:name, :string)
  end
end
