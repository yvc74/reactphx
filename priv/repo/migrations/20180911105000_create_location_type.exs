defmodule GW.Repo.Migrations.CreateGW.Comment.Type do
    use Ecto.Migration
  
    def change do
        create table(:location_type) do
          add :location_type_name, :string, size: 55, null: false
        timestampstz()
    end

  end
  
end