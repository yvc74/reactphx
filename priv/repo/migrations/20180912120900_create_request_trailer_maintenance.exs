defmodule GW.Repo.Migrations.CreateGW.Request.Trailer.Maintenance do
    use Ecto.Migration

    def change do
        create table(:request_trailer_maintenance) do
          add :maintenance_type_id, references(:request_trailer_maintenance_type, on_delete: :delete_all), null: false
          add :request_id, references(:request, on_delete: :delete_all), null: false
          add :location_id, references(:location, on_delete: :delete_all), null: false
          add :person_id, references(:person, on_delete: :delete_all), null: false
          add :trailer_id, references(:trailer, on_delete: :delete_all), null: false
          add :preferred_vendor_location_id, references(:location, on_delete: :delete_all)
          add :quoted_start_date, :date
          add :quoted_delivery_date, :date
          add :quoted_estimated_cost, :"double precision"
          add :trailer_condition_comment_id, references(:comment, on_delete: :delete_all)
          add :actual_delivery_date, :date
          add :maintenance_comment_id, references(:comment, on_delete: :delete_all)
        timestamps(type: :timestamptz)
    end
        create index(:request_trailer_maintenance, [:maintenance_type_id])
        create index(:request_trailer_maintenance, [:maintenance_comment_id])
        create index(:request_trailer_maintenance, [:request_id])
        create index(:request_trailer_maintenance, [:location_id])
        create index(:request_trailer_maintenance, [:person_id])
        create index(:request_trailer_maintenance, [:trailer_id])
        create index(:request_trailer_maintenance, [:preferred_vendor_location_id])
        create index(:request_trailer_maintenance, [:trailer_condition_comment_id])

  end

end
