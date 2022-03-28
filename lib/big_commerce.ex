defmodule BigCommerce do
  @moduledoc """
  Elixir client for [BigCommerce](https://developer.bigcommerce.com/api-reference/) API.
  """

  @doc ~S"""
  Create client

  Options are:

  * store_hash: unique identifier for store (required)
  * access_token: API acccess token (required)
  * adapter: Tesla adapter config (optional)
  * middleware: List of additional middleware module config (optional)

  ## Examples

      iex> BigCommerce.client(store_hash: "123456", access_token: "abc123")
      %Tesla.Client{
        adapter: nil,
        fun: nil,
        post: [],
        pre: [
          {Tesla.Middleware.BaseUrl, :call, ["https://api.bigcommerce.com/stores/123456"]},
          {Tesla.Middleware.Headers, :call,
           [[{"x-auth-token", "abc123"}, {"content-type", "application/json"}, {"accept", "application/json"}]]},
          {Tesla.Middleware.JSON, :call, [[]]},
          {Tesla.Middleware.Logger, :call, [[]]},
          {Tesla.Middleware.Telemetry, :call, [[]]},
          {Tesla.Middleware.OpenTelemetry, :call, [[]]}
        ]
      }
  """
  @spec client(Keyword.t()) :: Tesla.Client.t()
  def client(opts \\ []) do
    store_hash = Keyword.fetch!(opts, :store_hash)
    access_token = Keyword.fetch!(opts, :access_token)

    base_url = opts[:base_url] || "https://api.bigcommerce.com/stores/#{store_hash}"

    opts_middleware = opts[:middleware] || []
    adapter = opts[:adapter]

    middleware =
      opts_middleware ++
        [
          {Tesla.Middleware.BaseUrl, base_url},
          {Tesla.Middleware.Headers,
           [
             {"x-auth-token", access_token},
             {"content-type", "application/json"},
             {"accept", "application/json"}
           ]},
          Tesla.Middleware.JSON,
          Tesla.Middleware.Logger,
          Tesla.Middleware.Telemetry,
          Tesla.Middleware.OpenTelemetry
        ]

    Tesla.client(middleware, adapter)
  end

  @doc """
  Hello world.

  ## Examples

      iex> BigCommerce.hello()
      :world

  """
  def hello do
    :world
  end
end
