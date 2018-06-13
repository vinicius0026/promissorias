defmodule Promissorias.Accounts do
  @moduledoc """
  The Accounts context
  """

  alias Promissorias.Accounts.User

  def list_users do
    [
      %User{id: "1", name: "Silvio", username: "silvio"},
      %User{id: "2", name: "Yara", username: "yara"},
      %User{id: "3", name: "Gabriel", username: "gabriel"}
    ]
  end

  def get_user(id) do
    Enum.find(list_users(), fn map -> map.id == id end)
  end

  def get_user_by(params) do
    Enum.find(list_users(), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end)
  end
end
