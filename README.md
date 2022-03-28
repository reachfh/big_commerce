# BigCommerce

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `big_commerce` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:big_commerce, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/big_commerce>.

If you want to use Telemetry handler, make sure you add the following lines to your application start:

```elixir
OpentelemetryTesla.setup()
```

By default Tesla uses the adapter `Tesla.Adapter.Httpc`, because `:httpc` is
included in Erlang/OTP and does not require installation of any additional
dependency. It can be changed globally with config:

```elixir
config :tesla, :adapter, Tesla.Adapter.Hackney
```

This can be helpful to debug communications:
```elixir
config :tesla, Tesla.Middleware.Logger, debug: false
# Logging configuration is evaluated at compile time, so Tesla must be
# recompiled for the configuration to take effect:
#   mix deps.clean --build tesla
#   mix deps.compile tesla
```
