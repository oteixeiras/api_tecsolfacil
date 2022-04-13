defmodule ApiTecsolfacilWeb.AdressesController do
  use ApiTecsolfacilWeb, :controller

  def create(conn, params) do
    params
    |> ApiTecsolfacil.create_candidate()
    |> handle_response(conn)
  end

  defp handle_response({:ok, address}, conn) do
    conn
    |> put_status(:ok)
    |> render("create.json", address: address)
  end

  defp handle_response({:error, _changeset} = error, _conn), do: error
end
