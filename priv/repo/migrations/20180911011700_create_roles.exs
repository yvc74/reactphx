defmodule GW.Repo.Migrations.CreateGW.Roles do
    use Ecto.Migration
  
    def change do
      create table(:roles) do
        add :role_title, :string, size: 75, null: false
      timestamps(type: :timestamptz)
    end

  end
  
end