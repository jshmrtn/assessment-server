use Mix.Config

config :assessment_server, AssessmentServerWeb.Endpoint,
  load_from_system_env: true,
  url: [host: "example.com", port: 80],
  secret_key_base: "2urJKPPDpB2yN7iABI0klTD4r4vqS8xSxFMsAXWD5s38WcCNXrNTVAZY7MEMfFX2"

config :logger, level: :info
