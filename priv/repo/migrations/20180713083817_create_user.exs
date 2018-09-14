defmodule GW.Repo.Migrations.CreateGW.User do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :encrypted_password, :string, size: 255, null: false
      add :username, :string, size: 25, null: false
      #add :person_id, references(:person, on_delete: :delete_all), null: false
      add :email, :string, size: 100
      timestamps(type: :timestamptz)
    end

    #create index(:user, [:person_id])

  end

end
