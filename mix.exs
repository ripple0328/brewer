defmodule Brewer.MixProject do
  use Mix.Project

  @all_targets [:rpi0, :rpi3]

  def project do
    [
      app: :brewer,
      name: "brew",
      version: "0.1.0",
      elixir: "~> 1.8",
      archives: [nerves_bootstrap: "~> 1.4"],
      start_permanent: Mix.env() == :prod,
      build_embedded: true,
      aliases: [loadconfig: [&bootstrap/1]],
      deps: deps()
    ]
  end

  # Starting nerves_bootstrap adds the required aliases to Mix.Project.config()
  # Aliases are only added if MIX_TARGET is set.
  def bootstrap(args) do
    Application.start(:nerves_bootstrap)
    Mix.Task.run("loadconfig", args)
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Brewer.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # Dependencies for all targets
      {:nerves, "~> 1.4", runtime: false},
      {:shoehorn, "~> 0.4"},
      {:ring_logger, "~> 0.6"},
      {:toolshed, "~> 0.2"},
      {:nerves_hub_cli, "~> 0.1", runtime: false},
     # Dependencies for all targets except :host
      {:nerves_runtime, "~> 0.9", targets: @all_targets},
      {:nerves_network, "~> 0.5", targets: @all_targets},
      {:nerves_hub, "~> 0.1", targets: @all_targets},
      {:nerves_time, "~> 0.2", targets: @all_targets},
      # Dependencies for specific targets
      {:nerves_system_rpi0, "~> 1.6", runtime: false, targets: :rpi0},
      {:nerves_system_rpi3, "~> 1.6", runtime: false, targets: :rpi3}
    ]
  end
end
