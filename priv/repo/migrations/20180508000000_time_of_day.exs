defmodule GW.Repo.Migrations.Web.Models.Time.TimeOfDay do
    use Ecto.Migration
  
    def change do
      create table(:time_of_day) do
        add :time_of_day_name, :string, size: 25, null: false
      timestamps(type: :timestamptz)
    end

  end
  
end