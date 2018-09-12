defmodule GW.Repo.Migrations.CreateGW.Locations do
    use Ecto.Migration
  
    def change do
        create table(:locations) do
            add :region_id, references(:region, on_delete: :delete_all), null: false
            add :location_type_id, references(:location_type, on_delete: :delete_all), null: false
            add :location_name, :string, size: 100, null: false
            add :address_line_1, :string, size: 100, null: false
            add :address_line_2, :string, size: 100
            add :city, :string, size: 100, null:false
            add :state_province, :string, size: 100, null: false
            add :zip, :string, size: 10, null: false
            add :location_phone, :string, size: 20, null: false
            add :latitude, :float, precision: 15, null: false
            add :longitude, :float, precision: 15, null: false
            add :time_zone_id, references(:time_zone, on_delete: :delete_all), null: false
            add :primary_contact_user_id, references(:users, on_delete: :delete_all)
            add :primary_contact_phone, :string, size: 20
            add :primary_contact_first_name, :string, size: 100
            add :primary_contact_last_name, :string, size: 100
            add :primary_contact_email, :string, size: 100
            add :is_open_saturday, :boolean, null: false
            add :is_open_sunday, :boolean, null: false
            add :has_good_finders, :boolean, null: false
          timestampstz()
    end

    create index(:region, [:region_id])
    create index(:location_type, [:location_type_id])
    create index(:users, [:primary_contact_user_id])
    create index(:time_zone, [:time_zone_id])

  end
  
end