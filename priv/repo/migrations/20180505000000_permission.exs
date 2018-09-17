defmodule GW.Repo.Migrations.Users.Permission do
  use Ecto.Migration

  def change do
    create table(:permission) do
      add :permission_type, :string, size: 75, null: false
    timestamps(type: :timestamptz)
  end
end

end
