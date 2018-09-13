defmodule GW.Repo.Migrations.CreateGW.Address do
    use Ecto.Migration
  
    def change do
      create table(:address) do
        add :address_line_1, :string, size: 100, null: false
        add :address_line_2, :string, size: 100
        add :phone, :string, size: 25
        add :city, :string, size: 75
        add :state, :string, size: 75
        add :zip, :string, size: 10
      timestamps(type: :timestamptz)
    end
  end
  
end