defmodule GW.Repo.Migrations.CreateGW.Trailer.Tire.Size do
    use Ecto.Migration
  
    def change do
        create table(:trailer_tire_size) do
          add :tire_size, :string, size: 75, null: false
        timestampstz()
    end

  end
  
end