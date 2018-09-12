defmodule GW.Repo.Migrations.CreateGW.Request.Trailer.Maintenance do
    use Ecto.Migration
  
    def change do
        create table(:request_trailer_maintenance) do
          add :maintenance_type_id, references(:request_trailer_maintenance_type, on_delete: :delete_all), null: false
          add :request_id, references(:requests, on_delete: :delete_all), null: false
          add :location_id, references(:locations, on_delete: :delete_all), null: false
          add :user_id, references(:accounts_user, on_delete: :delete_all), null: false
          add :trailer_id, references(:trailers, on_delete: :delete_all), null: false
          add :preferred_vendor_location_id, references(:locations, on_delete: :delete_all)
          add :quoted_start_date, :date
          add :quoted_delivery_date, :date
          add :quoted_estimated_cost, :float, precision: 15
          add :trailer_condition_comment_id, references(:comments, on_delete: :delete_all)
          add :actual_delivery_date, :date
          add :maintenance_comment_id, references(:comments, on_delete: :delete_all)
        timestampstz()
    end
        create index(:request_trailer_maintenance_type, [:maintenance_type_id])
        create index(:comments, [:maintenance_comment_id])
        create index(:requests, [:request_id])
        create index(:locations, [:location_id])
        create index(:accounts_user, [:user_id])
        create index(:trailers, [:trailer_id])
        create index(:locations, [:preferred_vendor_location_id])
        create index(:comments, [:trailer_condition_comment_id])

  end
  
end