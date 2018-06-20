defmodule Promissorias.Repo.Migrations.UpdateCredentials do
  use Ecto.Migration

  def change do
    alter table(:credentials) do
      add(:is_admin, :boolean, default: false)
    end
  end
end
