defmodule PromissoriasWeb.InstallmentController do
  use PromissoriasWeb, :controller

  alias Promissorias.PromissoryNotes
  alias Promissorias.PromissoryNotes.Installment

  action_fallback(PromissoriasWeb.FallbackController)

  def index(conn, _params) do
    installments = PromissoryNotes.list_installments()
    render(conn, "index.json", installments: installments)
  end

  def create(conn, %{"installment" => installment_params}) do
    with {:ok, %Installment{} = installment} <-
           PromissoryNotes.create_installment(installment_params) do
      conn
      |> put_status(:created)
      |> render("show.json", installment: installment)
    end
  end

  def show(conn, %{"id" => id}) do
    installment = PromissoryNotes.get_installment!(id)
    render(conn, "show.json", installment: installment)
  end

  def update(conn, %{"id" => id, "installment" => installment_params}) do
    installment = PromissoryNotes.get_installment!(id)

    with {:ok, %Installment{} = installment} <-
           PromissoryNotes.update_installment(installment, installment_params) do
      render(conn, "show.json", installment: installment)
    end
  end

  def delete(conn, %{"id" => id}) do
    installment = PromissoryNotes.get_installment!(id)

    with {:ok, %Installment{}} <- PromissoryNotes.delete_installment(installment) do
      send_resp(conn, :no_content, "")
    end
  end
end
