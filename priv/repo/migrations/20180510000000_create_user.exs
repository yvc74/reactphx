defmodule GW.Repo.Migrations.CreateGW.User do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :username, :string, size: 25, null: false
      add :encrypted_password, :string, size: 255, null: false
      timestamps(type: :timestamptz)
    end
        
  end

end
