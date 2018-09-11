defmodule GW.Repo.Migrations.CreateGW.Maintenance.Type do
    use Ecto.Migration
  
    def change do
        create table(:maintenance_type) do
          add :maintenance_type_name, :string, size: 75, null: false
        timestampstz()
    end

  end
  
end