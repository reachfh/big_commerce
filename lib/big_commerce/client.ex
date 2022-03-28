defmodule BigCommerce.Client do
  @moduledoc false

  # Unwrap Tesla API responses

  use BigCommerce.Types

  @spec get(Tesla.Client.t(), Tesla.Env.url(), [Tesla.option()]) :: {:ok, any()} | {:error, code, reason}
  def get(client, url, opts \\ [])

  def get(client, url, opts) do
    tesla_response(Tesla.get(client, url, opts))
  end

  @spec delete(Tesla.Client.t(), Tesla.Env.url(), [Tesla.option()]) :: {:ok, any} | {:error, code, reason}
  def delete(client, url, opts \\ [])

  def delete(client, url, opts) do
    tesla_response(Tesla.delete(client, url, opts))
  end

  @spec post(Tesla.Client.t(), Tesla.Env.url(), Tesla.Env.body(), [Tesla.option()]) :: {:ok, any()} | {:error, code, reason}
  def post(client, url, body, opts \\ [])

  def post(client, url, body, opts) when is_binary(body) do
    tesla_response(Tesla.post(client, url, body, opts))
  end

  def post(client, url, body, opts) do
    case Jason.encode(body) do
      {:ok, encoded} ->
        post(client, url, encoded, opts)

      {:error, reason} ->
        {:error, 0, reason}
    end
  end

  @spec put(Tesla.Client.t(), Tesla.Env.url(), Tesla.Env.body(), [Tesla.option()]) :: {:ok, any()} | {:error, code, reason}
  def put(client, url, body, opts \\ [])

  def put(client, url, body, opts) when is_binary(body) do
    tesla_response(Tesla.put(client, url, body, opts))
  end

  def put(client, url, body, opts) do
    case Jason.encode(body) do
      {:ok, encoded} ->
        put(client, url, encoded, opts)

      {:error, reason} ->
        {:error, 0, reason}
    end
  end

  def tesla_response({:ok, %{status: 200, body: body}}), do: {:ok, body}
  def tesla_response({:ok, %{status: status, body: body}}), do: {:error, status, body}
  def tesla_response({:error, reason}), do: {:error, 0, reason}
end
