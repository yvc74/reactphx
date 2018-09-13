defmodule GW.Repo.Migrations.CreateGW.Image.Person do
    use Ecto.Migration

    def change do
        create table(:image_person) do
          add :image_guid, references(:image, column: :image_guid, type: :string, on_delete: :delete_all), null: false
          add :person_id, references(:person, on_delete: :delete_all), null: false
        timestamps(type: :timestamptz)
      end

      create index(:image_person, [:image_guid])
      create index(:image_person, [:person_id])

    end

  end
