defmodule AssessmentServer.GraphQL.Types do
  use Absinthe.Schema.Notation

  object :person do
    field :email, :string
    field :name, :string
  end
end
