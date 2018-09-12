defmodule GW.Repo.Migrations.CreateGW.Image.Adc.Trailer.Progress do
    use Ecto.Migration
  
    def change do
        create table(:image_adc_trailer_progress) do
          add :image_guid, references(:images, on_delete: :delete_all), null: false
          add :adc_trailer_status_id, references(:history_adc_trailer_status, on_delete: :delete_all), null: false
        timestamps(type: :timestamptz)
    end

    create index(:images, [:image_guid])
    create index(:history_adc_trailer_status, [:adc_trailer_status_id])

  end
  
end