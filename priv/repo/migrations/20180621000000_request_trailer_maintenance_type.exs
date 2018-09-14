defmodule GW.Repo.Migrations.Web.Models.Requests.RequestTrailerMaintenanceType do
    use Ecto.Migration
  
    def change do
      create table(:request_trailer_maintenance_type) do
        add :maintenance_type_name, :string, size: 75, null: false
      timestamps(type: :timestamptz)
    end

  end
  
end