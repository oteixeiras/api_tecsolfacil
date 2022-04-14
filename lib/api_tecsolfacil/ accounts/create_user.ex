defmodule ApiTecsolfacil.Accounts.CreateUser do
  alias ApiTecsolfacil.{Repo, User}

  def call(params) do
    params
    |> User.build()
    |> handle_creation()
  end

  def handle_creation({:ok, user}), do: Repo.insert(user)
  def handle_creation({:error, _changeset} = error), do: error
end
