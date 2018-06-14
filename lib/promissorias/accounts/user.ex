defmodule Promissorias.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Promissorias.Accounts.Credential

  @derive {Jason.Encoder, only: [:id, :name, :username, :credential]}

  schema "users" do
    field :name, :string
    field :username, :string
    has_one :credential, Credential

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username])
    |> unique_constraint(:username)
    |> validate_required([:name, :username])
    |> validate_length(:username, min: 1, max: 20)
  end

  def registration_changeset(user, params) do
    user
    |> changeset(params)
    |> Ecto.Changeset.cast_assoc(:credential, with: &Credential.changeset/2)
  end
end
