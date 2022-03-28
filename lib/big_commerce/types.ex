defmodule BigCommerce.Types do
  @moduledoc """
  Define API return types.
  """

  defmacro __using__(_opts) do
    quote do
      @type code :: non_neg_integer()
      @type reason :: any()
    end
  end
end
