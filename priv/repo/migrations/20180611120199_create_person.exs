defmodule GW.Repo.Migrations.CreateGW.Person do
    use Ecto.Migration

    def change do
      create table(:person) do
        add :first_name, :string, size: 75, null: false
        add :last_name, :string, size: 75, null: false
        add :username, :string, size: 25, null: false
        add :time_zone_id, references(:time_zone, on_delete: :delete_all), null: false
        add :phone, :string, size: 25
        add :email, :string, size: 100
       # add :primary_location_id, references(:location, on_delete: :delete_all), null: false
      timestamps(type: :timestamptz)

    end

    create index(:person, [:time_zone_id])

  end

end
