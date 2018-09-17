defmodule GW.Repo.Migrations.Trailers.TrailerLeaseConditionType do
    use Ecto.Migration
  
    def change do
      create table(:trailer_lease_condition_type) do
        add :lease_condition_name, :string, size: 75
      timestamps(type: :timestamptz)
    end
  end
  
end