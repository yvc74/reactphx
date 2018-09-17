defmodule GW.Repo.Migrations.Web.Models.History.HistoryTrailerServiceRequestStatus do
    use Ecto.Migration

    def change do
        create table(:history_trailer_service_request_status) do
          add :request_id, references(:request_trailer_service, column: :request_id, on_delete: :delete_all), null: false
          add :request_status_id, references(:request_trailer_service_status_type, on_delete: :delete_all), null: false
          add :user_id, references(:user, on_delete: :delete_all), null: false
          add :driver_id, references(:person, on_delete: :delete_all)
          add :request_comment_id, references(:comment, on_delete: :delete_all)
          add :picked_up_pallet_count, :integer
          add :delivered_pallet_count, :integer
          add :picked_up_blue_bin_count, :integer
          add :delivered_blue_bin_count, :integer
          add :picked_up_gaylord_count, :integer
          add :delivered_gaylord_count, :integer
          add :delivered_new_goods, :integer
          add :picked_up_large_item_count, :integer
          add :user_estimated_delivery_at, :utc_datetime
          add :system_estimated_delivery_at, :utc_datetime
          add :delivered_at, :utc_datetime
          add :accepted_by_store_representative, :string, size: 50

        timestamps(type: :timestamptz)
      end

      
      create index(:history_trailer_service_request_status, [:driver_id])  
      create index(:history_trailer_service_request_status, [:request_id])
      create index(:history_trailer_service_request_status, [:request_status_id])
      create index(:history_trailer_service_request_status, [:user_id])
      create index(:history_trailer_service_request_status, [:request_comment_id])

    end

  end
