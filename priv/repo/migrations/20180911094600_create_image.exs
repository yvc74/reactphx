defmodule GW.Repo.Migrations.CreateGW.Image do
    use Ecto.Migration

    def change do
        create table(:image, primary_key: false) do
          add :image_guid, :string, size: 255, primary_key: true, null: false
          add :person_id, references(:person, on_delete: :delete_all), null: false
        timestamps(type: :timestamptz)
      end

      create index(:image, [:person_id])

    end

  end
