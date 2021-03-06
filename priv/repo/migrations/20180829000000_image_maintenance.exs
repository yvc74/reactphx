defmodule GW.Repo.Migrations.Images.ImageMaintenance do
    use Ecto.Migration
  
    def change do
        create table(:image_maintenance) do
          add :image_guid, references(:image, column: :image_guid, type: :string, on_delete: :delete_all), null: false
          add :request_id, references(:request, on_delete: :delete_all), null: false
        timestamps(type: :timestamptz)
    end

    create index(:image_maintenance, [:image_guid])
    create index(:image_maintenance, [:request_id])
    
  end
  
end
