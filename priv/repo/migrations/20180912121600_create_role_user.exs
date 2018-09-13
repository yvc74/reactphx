defmodule GW.Repo.Migrations.CreateGW.Role.User do
    use Ecto.Migration
  
    def change do
        create table(:role_user) do
          add :user_id, references(:accounts_user, on_delete: :delete_all), null: false
<<<<<<< HEAD
          add :role_id, references(:roles, on_delete: :delete_all), null: false
        timestamps(type: :timestamptz)
    end
        create index(:accounts_user, [:user_id])
        create index(:roles, [:role_id])
=======
          add :role_id, references(:role, on_delete: :delete_all), null: false
        timestamps(type: :timestamptz)
    end
        create index(:accounts_user, [:user_id])
        create index(:role, [:role_id])
>>>>>>> d2c184e7ddcd1aeb698d56188ae0c479cc50a805
  end
  
end