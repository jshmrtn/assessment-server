defmodule AssessmentServer.PersonStorage do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def init(nil) do
      ets = :ets.new(__MODULE__, [:ordered_set, :protected])

      {:ok, ets}
  end

  def all do
    GenServer.call(__MODULE__, :all)
  end

  def add(email, name) do
    GenServer.call(__MODULE__, {:add, email, name})
  end

  def handle_call(:all, _, table) do
     :ets.tab2list(table)
     |> IO.inspect

    {:reply, :ets.tab2list(table), table}
  end

  def handle_call({:add, email, name}, _, table) do
    state = case :ets.lookup(table, email) do
      [] ->
        :ets.insert(table, {email, name})

        :ok
      _ ->
        :duplicate
    end

    {:reply, state, table}
  end
end
