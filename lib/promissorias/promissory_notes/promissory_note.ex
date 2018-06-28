defmodule Promissorias.PromissoryNotes.PromissoryNote do
  use Ecto.Schema
  import Ecto.Changeset

  schema "promissory_notes" do
    field(:amount, :decimal)
    belongs_to(:customer, Promissorias.Customers.Customer)

    timestamps()
  end

  @doc false
  def changeset(promissory_note, attrs) do
    promissory_note
    |> cast(attrs, [:amount])
    |> validate_required([:amount])
  end
end
