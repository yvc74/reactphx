defmodule GW.Repo.Migrations.CreateGW.Users do
    use Ecto.Migration
  
    def change do
        create table(:users) do
          add :firstname, :string, size: 75, null: false
          add :lastname, :string, size: 75, null: false
          add :username, :string, size: 25, null: false
          add :email, :string, size: 100, null: false
          add :encrypted_password :string, size: 255, null: false
          add :time_zone_id, references(:time_zone, on_delete: : delete_all), null: false
          add :home_location_id, references(:locations, on_delete: : delete_all), null: false
        timestampstz()
    end

    create index(:time_zone, [:time_zone_id])
    create index(:locations, [:home_location_id])
    
  end
  
end