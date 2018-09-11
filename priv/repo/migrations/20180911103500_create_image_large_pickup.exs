defmodule GW.Repo.Migrations.CreateGW.Image.Large.Pickup do
    use Ecto.Migration
  
    def change do
        create table(:image_large_pickup) do
          add :image_guid, references(:images, on_delete: :delete_all), null: false
          add :request_id references(:requests, on_delete: :delete_all), null: false
        timestampstz()
    end

    create index(:images, [:image_guid])
    create index(:requests, [:request_id])

  end
  
end