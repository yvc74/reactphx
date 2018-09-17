defmodule GW.Repo.Migrations.Trailers.TrailerTireSize do
    use Ecto.Migration
  
    def change do
      create table(:trailer_tire_size) do
        add :tire_size, :string, size: 75, null: false
      timestamps(type: :timestamptz)
    end

  end
  
end