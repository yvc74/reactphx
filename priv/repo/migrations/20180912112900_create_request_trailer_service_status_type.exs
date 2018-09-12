defmodule GW.Repo.Migrations.CreateGW.Request.Trailer.Service.Status.Type do
    use Ecto.Migration
  
    def change do
        create table(:request_trailer_service_status_type) do
          add :request_status_name, :string, size: 75, null: false
        timestampstz()
    end

  end
  
end