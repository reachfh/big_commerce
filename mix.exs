defmodule BigCommerce.MixProject do
  use Mix.Project

  @github "https://github.com/reachfh/big_commerce"

  def project do
    [
      app: :big_commerce,
      version: "0.1.0",
      elixir: "~> 1.13",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      source_url: @github,
      homepage_url: @github,
      docs: docs(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [coveralls: :test, "coveralls.detail": :test, "coveralls.post": :test, "coveralls.html": :test],
      dialyzer: [
        # plt_add_apps: [:erlavro, :tesla],
        # plt_add_deps: true,
        # flags: ["-Werror_handling", "-Wrace_conditions"],
        # flags: ["-Wunmatched_returns", :error_handling, :race_conditions, :underspecs],
        # ignore_warnings: "dialyzer.ignore-warnings"
      ],
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger] ++ extra_applications(Mix.env())
    ]
  end

  defp extra_applications(:test), do: [:hackney]
  defp extra_applications(_),     do: []

  # Specifies which paths to compile per environment
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:coverex, "~> 1.5", only: [:dev, :test], runtime: false},
      {:cowlib, "~> 2.9.0", override: true},
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.28.0", only: :dev, runtime: false},
      {:excoveralls, "~> 0.10", only: :test},
      {:google_protos, "~> 0.1"},
      {:hackney, "~> 1.18", only: [:dev, :test]},
      {:jason, "~> 1.3"},
      {:opentelemetry_api, "~> 1.0", override: true},
      {:opentelemetry_tesla, "~> 1.3.2-rc.4"},
      {:telemetry, "~> 0.4.3", override: true},
      {:tesla, "~> 1.4"},
    ]
  end

  defp description do
    "Client for BigCommerce API"
  end

  defp package do
    [
      maintainers: ["Jake Morrison"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => @github}
    ]
  end

  defp docs do
    [
      source_url: @github,
      extras: ["README.md", "CHANGELOG.md"],
      # api_reference: false,
      source_url_pattern: "#{@github}/blob/master/%{path}#L%{line}",
    ]
  end
end
