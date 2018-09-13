defmodule GW.Repo.Migrations.CreateGW.Role do
    use Ecto.Migration
  
    def change do
      create table(:role) do
        add :role_title, :string, size: 75, null: false
      timestamps(type: :timestamptz)
    end

  end
  
end