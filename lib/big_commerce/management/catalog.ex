defmodule BigCommerce.Management.Catalog do
  @moduledoc """
  Catalog API.
  """

  use BigCommerce.Types
  alias BigCommerce.Client

  @doc ~S"""
  Get products.
  """
  @spec get_products(Tesla.Client.t(), Keyword.t()) :: {:ok, any} | {:error, code, reason}
  def get_products(client, query \\ []) do
    Client.get(client, "/v3/catalog/products", query: query)
  end

end
