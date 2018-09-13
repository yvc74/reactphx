defmodule GW.Repo.Migrations.CreateGW.Time.Zone do
    use Ecto.Migration
  
    def change do
      create table(:time_zone) do
        add :time_zone_name, :string, size: 75, null: false
        add :time_zone_abbrev, :string, size: 5, null: false
        add :utc_offset, :integer, null: false
        add :is_dst, :boolean, null: false
      timestamps(type: :timestamptz)
    end

  end
  
end