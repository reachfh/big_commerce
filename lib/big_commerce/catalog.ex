defmodule BigCommerce.Catalog do
  @moduledoc """
  Catalog v3 API.
  """

  @type code :: non_neg_integer()
  @type reason :: any()

  alias BigCommerce.Client

  @doc ~S"""
  """
  @spec get_products(Tesla.Client.t(), Keyword.t()) :: {:ok, any} | {:error, code, reason}
  def get_products(client, query \\ []) do
    Client.get(client, "/catalog/products", query: query)
  end

end
