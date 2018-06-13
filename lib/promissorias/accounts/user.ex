defmodule Promissorias.Accounts.User do

  @derive {Jason.Encoder, only: [:id, :name, :username]}
  defstruct [:id, :name, :username]
end
