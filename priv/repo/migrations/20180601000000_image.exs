defmodule GW.Repo.Migrations.Images.Image do
    use Ecto.Migration

    def change do
        create table(:image, primary_key: false) do
          add :image_guid, :string, size: 255, primary_key: true, null: false
          add :user_id, references(:user, on_delete: :delete_all), null: false
        timestamps(type: :timestamptz)
      end

      create index(:image, [:user_id])

    end

  end
