# BigCommerce

This is a client library for the [BigCommerce API](https://developer.bigcommerce.com/).

## HTTP client

By default Tesla uses [httpc](https://www.erlang.org/doc/man/httpc.html) to
make HTTP client calls because it is included in Erlang/OTP and does not
require installation of any additional dependency. It is not, however,
recommended to use it in production environment as it does not validate SSL
certificates [among other issues](https://github.com/teamon/tesla/issues?utf8=%E2%9C%93&q=is%3Aissue+label%3Ahttpc+).

Change the adapter to [hackney](https://hex.pm/packages/hackney) globally in `config/config.exs`:

```elixir
config :tesla, :adapter, Tesla.Adapter.Hackney
```

and add it as a dependency in `mix.exs`:

```elixir
{:hackney, "~> 1.18"},
```

## Logging

When the Elixir Logger log level is set to `:debug`, the Tesla Logger will show
full request and response info. This can be pretty noisy. If you want to
disable detailed request/response logging, set `debug: false` in your config:

```elixir
config :tesla, Tesla.Middleware.Logger, debug: false
```

Logging configuration is evaluated at compile time, so Tesla must be
recompiled for the configuration to take effect:

```shell
mix deps.clean --build tesla
mix deps.compile tesla
```

## OpenTelemetry integration

Add the following lines to your `application` start:

```elixir
OpentelemetryTesla.setup()
```

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
