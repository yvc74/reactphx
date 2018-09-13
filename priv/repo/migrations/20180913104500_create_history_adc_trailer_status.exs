defmodule GW.Repo.Migrations.CreateGW.History.Adc.Trailer.Status do
    use Ecto.Migration

    def change do
        create table(:history_adc_trailer_status) do
          add :trailer_id, references(:trailer, on_delete: :delete_all), null: false
          add :percent_full, :integer, null: false
          add :donation_count, :integer, null: false
          add :captured_at, :datetime, null: false
          add :person_id, references(:person, on_delete: :delete_all), null: false
        timestamps(type: :timestamptz)
      end

      create index(:history_adc_trailer_status, [:trailer_id])
      create index(:history_adc_trailer_status, [:person_id])

    end
  end
