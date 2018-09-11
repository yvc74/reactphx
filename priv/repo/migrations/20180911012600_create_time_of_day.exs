defmodule GW.Repo.Migrations.CreateGW.Time.Of.Day do
    use Ecto.Migration
  
    def change do
        create table(:time_of_day) do
          add :time_of_day_name, :string, size: 25, null: false
        timestampstz()
    end

  end
  
end