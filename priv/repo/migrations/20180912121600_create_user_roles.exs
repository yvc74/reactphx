defmodule GW.Repo.Migrations.CreateGW.User.Roles do
    use Ecto.Migration
  
    def change do
        create table(:user_roles) do
          add :user_id, references(:users, on_delete: :delete_all), null: false
          add :role_id, references(:roles, on_delete: :delete_all), null: false

        timestampstz()
    end
        create index(:users, [:user_id])
        create index(:roles, [:role_id])
  end
  
end