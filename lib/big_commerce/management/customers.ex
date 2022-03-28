defmodule BigCommerce.Management.Customers do
  @moduledoc """
  Customers API.
  """

  use BigCommerce.Types
  alias BigCommerce.Client

  @doc ~S"""
  Create customers.

      create_customers = [
        %{
          "email" => "string@example.com",
          "first_name" => "string",
          "last_name" => "string",
          "company" => "string",
          "phone" => "string",
          "notes" => "string",
          "tax_exempt_category" => "string",
          "customer_group_id" => 0,
          "addresses" => [
            %{
              "address1" => "Addr 1",
              "address2" => "",
              "address_type" => "residential",
              "city" => "San Francisco",
              "company" => "History",
              "country_code" => "US",
              "first_name" => "Ronald",
              "last_name" => "Swimmer",
              "phone" => "707070707",
              "postal_code" => "33333",
              "state_or_province" => "California"
            }
          ],
          "authentication" => %{
            "force_password_reset" => true,
            "new_password" => "Secret!7"
          },
          "accepts_product_review_abandoned_cart_emails" => true,
          "store_credit_amounts" => [
            %{
              "amount" => 43.15
            }
          ],
          "origin_channel_id" => 1,
          "channel_ids" => [
            1
          ]
        }
      ]
  """

  @spec create_customers(Tesla.Client.t(), list(map()) | binary()) :: {:ok, any} | {:error, code, reason}
  def create_customers(client, data) do
    Client.post(client, "/v3/customers", data)
  end

  @doc ~S"""
  Get customers.

  Customers.get_customers(client, "id:in": 17)
  """
  @spec get_customers(Tesla.Client.t(), Keyword.t()) :: {:ok, any} | {:error, code, reason}
  def get_customers(client, query \\ []) do
    Client.get(client, "/v3/customers", query: query)
  end
end
