defmodule GW.Repo.Migrations.CreateGW.Comment.Type do
    use Ecto.Migration
  
    def change do
        create table(:image_adc_trailer_progress) do
          add :image_guid, references(:images, on_delete: :delete_all), null: false
          add :trailer_id, references(:trailers, on_delete: :delete_all) null: false
        timestampstz()
    end

    create index(:images, [:image_guid])
    create index(:traielrs, [:trailer_id])

  end
  
end