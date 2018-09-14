defmodule GW.Repo.Migrations.Web.Models.User.Person do
    use Ecto.Migration

    def change do
      create table(:person) do
        add :first_name, :string, size: 75, null: false
        add :last_name, :string, size: 75, null: false
        add :user_id, references(:user, on_delete: :delete_all)
        add :time_zone_id, references(:time_zone, on_delete: :delete_all), null: false
        add :phone, :string, size: 25
        add :email, :string, size: 100
       
       
      timestamps(type: :timestamptz)

    end

    create index(:person, [:time_zone_id])
    create index(:person, [:user_id])

  end

end
