defmodule GW.Repo.Migrations.CreateGW.Request.Trailer.Inspection.Type do
    use Ecto.Migration
  
    def change do
        create table(:request_trailer_inspection_type) do
          add :inspection_type_name, :string, size: 75, null: false
        timestampstz()
    end

  end
  
end