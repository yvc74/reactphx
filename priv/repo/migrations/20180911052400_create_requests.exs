defmodule GW.Repo.Migrations.Requests do
    use Ecto.Migration
  
    def change do
       create table(:requests) do
         add :request_type_id, references(:request_type, on_delete: :delete_all), null: false  
        timestampstz()
      end

      create index(:request_type, [:request_type_id])

    end
    
  end