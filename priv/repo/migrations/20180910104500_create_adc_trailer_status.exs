defmodule GW.Repo.Migrations.CreateGW.Adc.Trailer.Status do
    use Ecto.Migration
  
    def change do
      create table(:adc_trailer_status) do
        add :trailer_id, references(:trailers, on_delete: :delete_all), null: false
        add :percent_full, :integer, null: false
        add :donation_count, :integer, null: false
        add :captured_at, :utc_datetime, null: false
        add :user_id, references(:users, on_delete: :delete_all), null: false
        add :image_adc_trailer_progress_id, references(:image_adc_trailer_progress, on_delete: :delete_all), null: false
      timestamps()
      end
  
      create index(:trailers, [:trailer_id])
      create index(:users, [:user_id])
      create index(:image_adc_trailer_progress, [:image_adc_trailer_progress_id])
    end
  end