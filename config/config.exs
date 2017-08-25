use Mix.Config

config :assessment_server, AssessmentServerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "p2DzUxkEeGA/a1Q0VBVvI7p5d0TEDOysY5wUCHqMtzQ70amuhsDvGULPhxCD9IUT",
  render_errors: [view: AssessmentServerWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: AssessmentServer.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

import_config "#{Mix.env}.exs"
