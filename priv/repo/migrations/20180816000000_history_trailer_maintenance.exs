defmodule GW.Repo.Migrations.Web.Models.History.HistoryTrailerMaintenance do
    use Ecto.Migration

    def change do
      create table(:history_trailer_maintenance) do
        add :maintenance_id, references(:request_trailer_maintenance, column: :request_id, on_delete: :delete_all), null: false
        add :user_id, references(:user, on_delete: :delete_all), null: false
        add :preferred_vendor_location_id, references(:location, on_delete: :delete_all)
        add :quoted_start_date, :date
        add :quoted_delivery_date, :date
        add :quoted_estimated_cost, :"double precision"
        add :trailer_condition_comment_id, references(:comment, on_delete: :delete_all)
        add :performed_by_person_id, references(:person, on_delete: :delete_all)
        add :actual_delivery_date, :date
        add :maintenance_comment_id, references(:comment, on_delete: :delete_all)
      timestamps(type: :timestamptz)
    end

    create index(:history_trailer_maintenance, [:maintenance_id])
    create index(:history_trailer_maintenance, [:user_id])
    create index(:history_trailer_maintenance, [:preferred_vendor_location_id])
    create index(:history_trailer_maintenance, [:performed_by_person_id])
    create index(:history_trailer_maintenance, [:maintenance_comment_id])
    create index(:history_trailer_maintenance, [:trailer_condition_comment_id])

  end

end
