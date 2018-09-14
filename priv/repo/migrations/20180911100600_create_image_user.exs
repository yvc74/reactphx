defmodule GW.Repo.Migrations.CreateGW.Image.User do
    use Ecto.Migration

    def change do
        create table(:image_user) do
          add :image_guid, references(:image, column: :image_guid, type: :string, on_delete: :delete_all), null: false
          add :user_id, references(:user, on_delete: :delete_all), null: false
        timestamps(type: :timestamptz)
      end

      create index(:image_user, [:image_guid])
      create index(:image_user, [:user_id])

    end

  end
