defmodule GW.Repo.Migrations.CreateGW.Comment.Type do
    use Ecto.Migration
  
    def change do
        create table(:image_large_pickup) do
          add :image_guid, references(:images, on_delete: :delete_all), null: false
          add :trailer_request_id references(:trailer_request, on_delete: :delete_all), null: false
        timestampstz()
    end

    create index(:images, [:image_guid])
    create index(:trailer_request, [:trailer_request_id])

  end
  
end