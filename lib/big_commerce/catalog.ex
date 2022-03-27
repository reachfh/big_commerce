defmodule BigCommerce.Catalog do
  @moduledoc """
  Catalog v3 API.
  """

  @type code :: non_neg_integer()
  @type reason :: any()

  @doc ~S"""
  """
  @spec get_products(Tesla.Client.t(), Keyword.t()) :: {:ok, any} | {:error, code, reason}
  def get_products(client, query \\ []) do
    Tesla.get(client, "/catalog/products", query: query)
  end

end
