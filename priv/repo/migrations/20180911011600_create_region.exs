defmodule GW.Repo.Migrations.CreateGW.Region do
    use Ecto.Migration
  
    def change do
      create table(:region) do
        add :region_name, :string, size: 75, null: false
      timestamps(type: :timestamptz)
    end

  end
  
end