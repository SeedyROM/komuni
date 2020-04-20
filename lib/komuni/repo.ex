defmodule Komuni.Repo do
  use Ecto.Repo,
    otp_app: :komuni,
    adapter: Ecto.Adapters.Postgres
end
