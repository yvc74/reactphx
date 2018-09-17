defmodule GW.Repo.Migrations.Histories.HistoryTrailerContent do
    use Ecto.Migration

    def change do
      create table(:history_trailer_content) do
        add :trailer_id, references(:trailer, on_delete: :delete_all), null: false
        add :trailer_content_type_id, references(:trailer_content_type, on_delete: :delete_all), null: false
        add :user_id, references(:user, on_delete: :delete_all), null: false
      timestamps(type: :timestamptz)
    end

    create index(:history_trailer_content, [:trailer_id])
    create index(:history_trailer_content, [:trailer_content_type_id])
    create index(:history_trailer_content, [:user_id])

  end

end
