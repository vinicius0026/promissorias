defmodule PromissoriasWeb.PromissoryNoteController do
  use PromissoriasWeb, :controller

  alias Promissorias.PromissoryNotes
  alias Promissorias.PromissoryNotes.PromissoryNote
  alias Promissorias.Customers
  alias Promissorias.Customers.Customer

  action_fallback(PromissoriasWeb.FallbackController)

  def index(conn, _params) do
    promissory_notes = PromissoryNotes.list_promissory_notes()
    render(conn, "index.json", promissory_notes: promissory_notes)
  end

  def create(conn, %{"promissory" => promissory_note_params, "customer" => customer_params}) do
    with {:ok, %Customer{} = customer} <- Customers.create_customer(customer_params),
         {:ok, %PromissoryNote{} = promissory_note} <-
           PromissoryNotes.create_promissory_note(customer, promissory_note_params) do
      conn
      |> put_status(:created)
      |> render("show.json", promissory_note: promissory_note)
    end
  end

  def show(conn, %{"id" => id}) do
    promissory_note = PromissoryNotes.get_promissory_note!(id)
    render(conn, "show.json", promissory_note: promissory_note)
  end

  def update(conn, %{"id" => id, "promissory_note" => promissory_note_params}) do
    promissory_note = PromissoryNotes.get_promissory_note!(id)

    with {:ok, %PromissoryNote{} = promissory_note} <-
           PromissoryNotes.update_promissory_note(promissory_note, promissory_note_params) do
      render(conn, "show.json", promissory_note: promissory_note)
    end
  end

  def delete(conn, %{"id" => id}) do
    promissory_note = PromissoryNotes.get_promissory_note!(id)

    with {:ok, %PromissoryNote{}} <- PromissoryNotes.delete_promissory_note(promissory_note) do
      send_resp(conn, :no_content, "")
    end
  end
end
