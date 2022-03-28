# BigCommerce

This is a client library for the [BigCommerce API](https://developer.bigcommerce.com/).

## Installation

Add `big_commerce` to the app dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:big_commerce, "~> 0.1.0"}
  ]
end
```

Documentation is on [HexDocs](https://hexdocs.pm/big_commerce).
To generate a local copy, run `mix docs`.

## Configuration

### HTTP client

### Optional dependencies

By default Tesla uses [httpc](https://www.erlang.org/doc/man/httpc.html) to
make HTTP client calls because it is included in Erlang/OTP and does not
require installation of any additional dependency. It is not, however,
recommended to use it in production environment as it does not validate SSL
certificates [among other issues](https://github.com/teamon/tesla/issues?utf8=%E2%9C%93&q=is%3Aissue+label%3Ahttpc+).

Change the adapter to e.g. [hackney](https://hex.pm/packages/hackney) globally in `config/config.exs`:

```elixir
config :tesla, :adapter, Tesla.Adapter.Hackney
```

and add it as a dependency in `mix.exs`:

```elixir
{:hackney, "~> 1.18"},
```

### OpenTelemetry integration

Add the following lines to your `application` start:

```elixir
OpentelemetryTesla.setup()
```

### Logging

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

## Usage

Talking to the BigCommerce API requires a `store_hash`, which identifies the specific
store, and an `access_token` which authenticates the client.

First create an API client, which will then be used for calls to the API:

```elixir
client = BigCommerce.client(store_hash: "123456", access_token: "abc123")
```

A good way to do this is create a config section in your app:

```elixir
config :myapp, :big_commerce_client,
    store_hash = "123456",
    access_token = "abc123"
```

Then in code, you can do:

```elixir
client_config = Application.get_env(:myapp, :big_commerce_client)
client = BigCommerce.client(client_config)
```

After you have the client, make api calls like this:

```elixir
BigCommerce.Catalog.get_products(client)
```
