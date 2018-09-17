defmodule GW.Repo.Migrations.Users.RoleUser do
    use Ecto.Migration

    def change do
        create table(:role_user) do
          add :person_id, references(:person, on_delete: :delete_all), null: false
          add :role_id, references(:role, on_delete: :delete_all), null: false
        timestamps(type: :timestamptz)
    end
        create index(:role_user, [:person_id])
        create index(:role_user, [:role_id])
  end

end
