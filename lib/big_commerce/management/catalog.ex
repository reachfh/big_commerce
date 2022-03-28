defmodule BigCommerce.Management.Catalog do
  @moduledoc """
  Catalog API.
  """

  @type code :: non_neg_integer()
  @type reason :: any()

  alias BigCommerce.Client

  @doc ~S"""
  Get products, with support for querying.
  """
  @spec get_products(Tesla.Client.t(), Keyword.t()) :: {:ok, any} | {:error, code, reason}
  def get_products(client, query \\ []) do
    Client.get(client, "/v3/catalog/products", query: query)
  end

end
