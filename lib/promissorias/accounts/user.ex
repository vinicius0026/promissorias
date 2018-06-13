defmodule Promissorias.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  @derive {Jason.Encoder, only: [:id, :name, :username]}

  schema "users" do
    field :name, :string
    field :username, :string

    timestamps()
  end
end
