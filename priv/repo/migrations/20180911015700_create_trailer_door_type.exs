defmodule GW.Repo.Migrations.CreateGW.Trailer.Door.Type do
    use Ecto.Migration
  
    def change do
      create table(:trailer_door_type) do
        add :trailer_door_type_name, :string, size: 75, null:false
      timestampstz()
      end
  
    end
    
  end