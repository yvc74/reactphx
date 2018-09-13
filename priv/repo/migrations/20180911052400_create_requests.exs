defmodule GW.Repo.Migrations.Request do
    use Ecto.Migration
  
    def change do
        create table(:request) do
          add :request_type_id, references(:request_type, on_delete: :delete_all), null: false  
        timestamps(type: :timestamptz)
      end

      create index(:request_type, [:request_type_id])

    end
    
  end