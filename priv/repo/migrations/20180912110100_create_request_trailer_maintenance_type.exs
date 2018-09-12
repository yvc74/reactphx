defmodule GW.Repo.Migrations.CreateGW.Request.Trailer.Maintenance.Type do
    use Ecto.Migration
  
    def change do
        create table(:request_trailer_maintenance_type) do
          add :maintenance_type_name, :string, size: 75, null: false
        timestampstz()
    end

  end
  
end