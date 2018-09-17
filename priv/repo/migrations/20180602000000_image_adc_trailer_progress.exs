defmodule GW.Repo.Migrations.Web.Models.Images.ImageAdcTrailerProgress do
    use Ecto.Migration
  
    def change do
        create table(:image_adc_trailer_progress) do
          add :image_guid, references(:image, column: :image_guid, type: :string, on_delete: :delete_all), null: false
          add :adc_trailer_status_id, references(:history_adc_trailer_status, on_delete: :delete_all), null: false
        timestamps(type: :timestamptz)
    end

    create index(:image_adc_trailer_progress, [:image_guid])
    create index(:image_adc_trailer_progress, [:adc_trailer_status_id])

  end
  
end