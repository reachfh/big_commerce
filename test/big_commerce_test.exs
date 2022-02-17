defmodule BigCommerceTest do
  use ExUnit.Case
  doctest BigCommerce

  test "greets the world" do
    assert BigCommerce.hello() == :world
  end
end
