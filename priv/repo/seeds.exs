# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Promissorias.Repo.insert!(%Promissorias.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Promissorias.Accounts.register_user(%{
  username: "admin",
  name: "admin",
  credential: %{is_admin: true, password: "password", email: "admin@example.com"}
})

Promissorias.Accounts.register_user(%{
  username: "user",
  name: "user",
  credential: %{password: "password", email: "user@example.com"}
})
