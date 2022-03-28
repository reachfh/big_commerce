defmodule BigCommerce.Client do
  @moduledoc false

  # Unwrap Tesla API responses

  @type code :: non_neg_integer()
  @type reason :: any()

  @spec get(Tesla.Client.t(), binary(), Keyword.t()) :: {:ok, any} | {:error, code, reason}
  def get(client, url, query \\ []) do
    tesla_response(Tesla.get(client, url, query))
  end

  @spec delete(Tesla.Client.t(), binary()) :: {:ok, any} | {:error, code, reason}
  def delete(client, url) do
    tesla_response(Tesla.delete(client, url))
  end

  @spec post(Tesla.Client.t(), binary(), any()) :: {:ok, any} | {:error, code, reason}
  def post(client, url, data) when is_binary(data) do
    tesla_response(Tesla.post(client, url, data))
  end

  def post(client, url, data) do
    case Jason.encode(data) do
      {:ok, encoded} ->
        post(client, url, encoded)

      {:error, reason} ->
        {:error, 0, reason}
    end
  end

  @spec put(Tesla.Client.t(), binary, any) :: {:ok, any} | {:error, code, reason}
  def put(client, url, data) when is_binary(data) do
    tesla_response(Tesla.put(client, url, data))
  end

  def put(client, url, data) do
    case Jason.encode(data) do
      {:ok, encoded} ->
        put(client, url, encoded)

      {:error, reason} ->
        {:error, 0, reason}
    end
  end

  def tesla_response({:ok, %{status: 200, body: body}}), do: {:ok, body}
  def tesla_response({:ok, %{status: status, body: body}}), do: {:error, status, body}
  def tesla_response({:error, reason}), do: {:error, 0, reason}
end
