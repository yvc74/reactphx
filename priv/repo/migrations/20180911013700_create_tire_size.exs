defmodule GW.Repo.Migrations.CreateGW.Tire.Size do
    use Ecto.Migration
  
    def change do
        create table(:tire_size) do
          add :tire_size, :string, size: 75, null: false
        timestampstz()
    end

  end
  
end