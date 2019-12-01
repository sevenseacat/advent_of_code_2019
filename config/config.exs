use Mix.Config

config :advent,
  benchee: [
    print: [benchmarking: false, configuration: false],
    formatters: [{Benchee.Formatters.Console, comparison: false}]
  ]
