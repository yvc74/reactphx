defmodule GW.Repo.Migrations.Trailers.TrailerDoorType do
    use Ecto.Migration
  
    def change do
        create table(:trailer_door_type) do
          add :trailer_door_type_name, :string, size: 75, null: false
        timestamps(type: :timestamptz)
      end
  
    end
    
  end