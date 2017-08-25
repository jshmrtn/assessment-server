defmodule AssessmentServerWeb.Router do
  use AssessmentServerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: AssessmentServer.GraphQL.Schema

  forward "/", Absinthe.Plug,
    schema: AssessmentServer.GraphQL.Schema
end
