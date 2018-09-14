defmodule GW.Repo.Migrations.CreateGW.Trailer.Status do
    use Ecto.Migration
  
    def change do
        create table(:trailer_status) do
          add :trailer_status_name, :string, size: 75, null: false
        timestamps(type: :timestamptz)
    end

  end
  
end