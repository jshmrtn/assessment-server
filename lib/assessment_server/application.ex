defmodule AssessmentServer.Application do
  use Application

  def start(_type, _args) do
    children = [
      AssessmentServerWeb.Endpoint,
      AssessmentServer.PersonStorage,
    ]

    opts = [strategy: :one_for_one, name: AssessmentServer.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    AssessmentServerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
