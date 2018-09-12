defmodule GW.Repo.Migrations.CreateGW.Image.Maintenance do
    use Ecto.Migration
  
    def change do
        create table(:image_maintenance) do
          add :image_guid, references(:images, on_delete: :delete_all), null: false
          add :request_id, references(:requests, on_delete: :delete_all), null: false
        timestamps(type: :timestamptz)
    end

    create index(:images, [:image_guid])
    create index(:requests, [:request_id])
    
  end
  
end