defmodule BigCommerce.Management.Customers do
  @moduledoc """
  Customers API.
  """

  @type code :: non_neg_integer()
  @type reason :: any()

  alias BigCommerce.Client

  @doc ~S"""
  Create customer.

  customer = %{
    "firstName" => "Jane",
    "lastName" => "Doe",
    "email" => "janedoe@example.com",
    "password" => "Secret!",
    "acceptsMarketingEmails" => true,
    "customFields" => [
        %{
          "fieldId" => "25",
          "fieldValue" => "Leave in backyard"
        }
      ]
    }

  """

  @spec create_customer(Tesla.Client.t(), map() | list(map())) :: {:ok, any} | {:error, code, reason}
  def create_customer(client, data) when is_list(data) do
    Client.post(client, "/v3/customers", data)
  end

  def create_customer(client, data) when is_map(data) do
    create_customer(client, [data])
  end

  @doc ~S"""
  Get customers.
  """
  @spec get_customers(Tesla.Client.t(), Keyword.t()) :: {:ok, any} | {:error, code, reason}
  def get_customers(client, query \\ []) do
    Client.get(client, "/v3/customers", query: query)
  end
end
