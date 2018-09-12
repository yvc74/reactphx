defmodule GW.Repo.Migrations.CreateGW.Trailer.Maintenance.Request do
    use Ecto.Migration
  
    def change do
        create table(:trailer_maintenance_request) do
          add :maintenance_type_id, references(:maintenance_type, on_delete: :delete_all), null: false
          add :request_id
          add :location_id, references(:locations, on_delete: :delete_all), null: false
          add :user_id, references(:users, on_delete: :delete_all), null: false
          add :trailer_id, references(:trailers, on_delete: :delete_all), null: false
          add :preferred_vendor_location_id, references(:locations, on_delete: :delete_all)
          add :quoted_start_date, :date
          add :quoted_delivery_date, :date
          add :quoted_estimated_cost, :float, precision: 15
          add :trailer_condition_comment_id, references(:comments, on_delete: :delete_all)
        timestampstz()
    end
        create index(:maintenance_type, [:maintenance_type_id])
        create index(:locations, [:location_id])


  end
  
end