defmodule GW.Repo.Migrations.CreateGW.Image.Large.Pickup do
    use Ecto.Migration
  
    def change do
        create table(:image_large_pickup) do
          add :image_guid, references(:image, column: :image_guid, type: :string, on_delete: :delete_all), null: false
          add :request_id, references(:request, on_delete: :delete_all), null: false
        timestamps(type: :timestamptz)
    end

    create index(:image_large_pickup, [:image_guid])
    create index(:image_large_pickup, [:request_id])

  end
  
end
