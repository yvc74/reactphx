defmodule GW.Repo.Migrations.CreateGW.Person.Address do
    use Ecto.Migration
  
    def change do
        create table(:person_address) do
          add :person_id, references(:person, on_delete: :delete_all), null: false
          add :address_id, references(:address, on_delete: :delete_all), null: false
        timestamps(type: :timestamptz)
      end

      create index(:person_address, [:person_id])
      create index(:person_address, [:address_id])
      
    end
    
  end