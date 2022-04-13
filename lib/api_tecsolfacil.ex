defmodule ApiTecsolfacil do
  alias ApiTecsolfacil.{Address,Accounts}

    @moduledoc """
    Plugfacilapi keeps the contexts that define your domain
    and business logic.
    Contexts are also responsible for managing your data, regardless
    if it comes from the database, an external API or others.
    """
    defdelegate format_of_cep(params), to: Address.FormateInputCep, as: :call
    defdelegate create_candidate(params), to: Address.Create, as: :call


    defdelegate create_user(params), to: Accounts.CreateUser, as: :call
end
