defmodule GW.Repo.Migrations.CreateGW.History.Adc.Trailer.Status do
    use Ecto.Migration
  
    def change do
        create table(:history_adc_trailer_status) do
          add :trailer_id, references(:trailer, on_delete: :delete_all), null: false
          add :percent_full, :integer, null: false
          add :donation_count, :integer, null: false
          add :captured_at, :datetime, null: false
          add :user_id, references(:accounts_user, on_delete: :delete_all), null: false
        timestamps(type: :timestamptzs)
      end
  
      create index(:trailer, [:trailer_id])
      create index(:accounts_user, [:user_id])

    end
  end