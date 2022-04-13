defmodule ApiTecsolfacilWeb.FallbackController do
  use ApiTecsolfacilWeb, :controller

  def call(conn, {:error, changeset}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ApiTecsolfacilWeb.ErrorView)
    |> render("400.json", changeset: changeset)
  end
end
