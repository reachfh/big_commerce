defmodule BigCommerce.Management.Cart do
  @moduledoc """
  Cart API.
  """

  use BigCommerce.Types
  alias BigCommerce.Client

  @doc ~S"""
  Create cart.
  """
  @spec create_cart(Tesla.Client.t(), map() | binary(), Keyword.t()) :: {:ok, any} | {:error, code, reason}
  def create_cart(client, data, opts \\ []) do
    Client.post(client, "/v3/carts", data, opts)
  end

end
