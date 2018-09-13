defmodule GW.Repo.Migrations.CreateGW.Access.Role do
  use Ecto.Migration

  def change do
    create table(:access_role) do
      add :role_id, references(:role, on_delete: :delete_all), null: false
      add :access_id, references(:access, on_delete: :delete_all), null: false
      timestamps(type: :timestamptz)
    end
  end

   create index(:access_role, [:role_id])
   create index(:access_role, [:access_id])

end
