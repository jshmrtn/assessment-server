defmodule AssessmentServerWeb.Router do
  use AssessmentServerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", AssessmentServerWeb do
    pipe_through :api
  end
end
