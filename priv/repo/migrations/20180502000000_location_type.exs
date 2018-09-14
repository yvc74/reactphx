defmodule GW.Repo.Migrations.Web.Models.Location.Type do
    use Ecto.Migration
  
    def change do
        create table(:location_type) do
          add :location_type_name, :string, size: 75, null: false
        timestamps(type: :timestamptz)
    end

  end
  
end