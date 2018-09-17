defmodule GW.Repo.Migrations.Requests.RequestTrailerInspectionType do
    use Ecto.Migration
  
    def change do
        create table(:request_trailer_inspection_type) do
          add :inspection_type_name, :string, size: 75, null: false
        timestamps(type: :timestamptz)
    end

  end
  
end