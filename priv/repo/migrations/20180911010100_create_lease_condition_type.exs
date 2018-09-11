defmodule GW.Repo.Migrations.CreateGW.Lease.Condition.Type do
    use Ecto.Migration
  
    def change do
        create table(:lease_condition_type) do
          add :lease_condition_name, :string, size: 75
          timestampstz()
    end
  end
  
end