defmodule GW.Repo.Migrations.CreateGW.Location do
    use Ecto.Migration

    def change do
        create table(:location) do
          add :region_id, references(:region, on_delete: :delete_all), null: false
          add :location_type_id, references(:location_type, on_delete: :delete_all), null: false
          add :location_name, :string, size: 100, null: false
          add :address_id, references(:address, on_delete: :delete_all), null: false
          add :latitude, :"double precision", null: false
          add :longitude, :"double precision", null: false
          add :time_zone_id, references(:time_zone, on_delete: :delete_all), null: false
          add :is_open_saturday, :boolean, null: false
          add :is_open_sunday, :boolean, null: false
          add :has_good_finders, :boolean, null: false
        timestamps(type: :timestamptz)
    end

    create index(:location, [:region_id])
    create index(:location, [:location_type_id])
    create index(:location, [:address_id])
    create index(:location, [:time_zone_id])


  end

end
