defmodule Promissorias.PromissoryNotes.PromissoryNote do
  use Ecto.Schema
  import Ecto.Changeset

  alias Promissorias.PromissoryNotes.Installment

  schema "promissory_notes" do
    field(:amount, :decimal)

    belongs_to(:customer, Promissorias.Customers.Customer)
    has_many(:installments, Installment, on_replace: :delete)

    timestamps()
  end

  @doc false
  def changeset(promissory_note, attrs) do
    promissory_note
    |> cast(attrs, [:amount])
    |> validate_required([:amount])
    |> cast_assoc(:installments)
  end
end
