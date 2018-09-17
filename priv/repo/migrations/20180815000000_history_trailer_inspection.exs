defmodule GW.Repo.Migrations.Web.Models.History.HistoryTrailerInspection do
    use Ecto.Migration

    def change do
      create table(:history_trailer_inspection) do
        add :inspection_id, references(:request_trailer_inspection, column: :request_id, on_delete: :delete_all), null: false
        add :user_id, references(:user, on_delete: :delete_all), null: false
        add :occured_at, :utc_datetime
        add :location_id, references(:location, on_delete: :delete_all)
        add :performed_by_person, references(:person, on_delete: :delete_all)
        add :inspection_comment_id, references(:comment, on_delete: :delete_all)
      timestamps(type: :timestamptz)
    end

    create index(:history_trailer_inspection, [:inspection_id])
    create index(:history_trailer_inspection, [:user_id])
    create index(:history_trailer_inspection, [:location_id])
    create index(:history_trailer_inspection, [:performed_by_person])
    create index(:history_trailer_inspection, [:inspection_comment_id])

  end

end
