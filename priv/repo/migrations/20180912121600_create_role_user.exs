defmodule GW.Repo.Migrations.CreateGW.Role.User do
    use Ecto.Migration
  
    def change do
        create table(:role_user) do
          add :user_id, references(:accounts_user, on_delete: :delete_all), null: false
          add :role_id, references(:role, on_delete: :delete_all), null: false
        timestamps(type: :timestamptz)
    end
        create index(:accounts_user, [:user_id])
        create index(:role, [:role_id])
  end
  
end