use Mix.Config

config :assessment_server, AssessmentServerWeb.Endpoint,
  http: [port: 4001],
  server: false

config :logger, level: :warn
