defmodule AssessmentServer.GraphQL.Schema do
  use Absinthe.Schema

  alias AssessmentServer.GraphQL.Types
  alias AssessmentServer.PersonStorage

  import_types Types

  query do
    field :persons, list_of(:person) do
      resolve fn _, _ ->
        persons = PersonStorage.all()
        |> Enum.map(fn {email, name} ->
          %{email: email, name: name}
        end)

        {:ok, persons}
      end
    end
  end

  mutation do
    @desc "Create a person"
    field :person, type: :person do
      arg :email, non_null(:string)
      arg :name, non_null(:string)

      resolve fn %{email: email, name: name}, _ ->
        with :ok <- PersonStorage.add(email, name) do
          {:ok, %{email: email, name: name}}
        else
          :duplicate ->
            {:error, [%{arg: "email", message: "Email Duplicated"}]}
        end
      end
    end
  end
end
