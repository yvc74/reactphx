defmodule GW.Repo.Migrations.History.Trailer.Service.Request.Status do
    use Ecto.Migration
  
    def change do
      create table(:history_trailer_service_request_status) do
        add :request_id, references(:requests, on_delete: :delete_all), null: false
        add :request_status_id, references(:request_trailer_service_status, on_delete: :delete_all), null: false
        add :user_id, references(:users, on_delete: :delete_all), null: false
      timestampstz()
      end

      create index(:requests, [:request_id])
      create index(:request_trailer_service_status, [:request_status_id])
      create index(:users, [:user_id])
      
    end

  end