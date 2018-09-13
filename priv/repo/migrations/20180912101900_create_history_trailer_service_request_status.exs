defmodule GW.Repo.Migrations.History.Trailer.Service.Request.Status do
    use Ecto.Migration
  
    def change do
        create table(:history_trailer_service_request_status) do
          add :request_id, references(:request, on_delete: :delete_all), null: false
          add :request_status_id, references(:request_trailer_service_status, on_delete: :delete_all), null: false
          add :user_id, references(:accounts_user, on_delete: :delete_all), null: false
        timestamps(type: :timestamptz)
      end

      create index(:request, [:request_id])
      create index(:request_trailer_service_status, [:request_status_id])
      create index(:accounts_user, [:user_id])
      
    end

  end