defmodule GW.Repo.Migrations.CreateGW.Person.Location do
  use Ecto.Migration

  def change do
      create table(:person_location) do
        add :person_id, references(:person, on_delete: :delete_all), null: false
        add :location_id, references(:address, on_delete: :delete_all), null: false
        add :is_primary_location, :boolean, null: false
        add :is_primary_contact, :boolean, null: false
      timestamps(type: :timestamptz)
    end

    create index(:person_location, [:person_id])
    create index(:person_location, [:location_id])

  end

end
