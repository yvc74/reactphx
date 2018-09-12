defmodule GW.Repo.Migrations.CreateGW.Request.Trailer.Service do
    use Ecto.Migration
  
    def change do
      create table(:request_trailer_service) do
        add :request_id, references(:request, on_delete: :delete_all), null: false
        add :location_id, references(:location, on_delete: delete_all), null: false
        add :user_id, references(:accounts_user, on_delete: :delete_all), null: false
        add :driver_id, references(:accounts_user, on_delete: :delete_all)
        add :requested_delivery_on, :date, null: false
        add :requested_time_of_day_id, references(:time_of_day, on_delete: :delete_all)
        add :requested_delivery_from, :datetime
        add :requested_delivery_to, :datetime
        add :request_comment_id, references(:comments, on_delete: :delete_all)
        add :trailer_condition_comment_id, references(:comments, on_delete: :delete_all)
        add :request_out_pallet_count, :integer, null: false
        add :request_in_pallet_count, :integer, null: false
        add :picked_up_pallet_count, :integer
        add :delivered_pallet_count, :integer
        add :requested_out_blue_bin_count, :integer, null: false
        add :requested_in_blue_bin_count, :integer, null: false
        add :picked_up_blue_bin_count, :integer
        add :delivered_blue_bin_count, :integer
        add :requested_out_gaylord_count, :integer, null: false
        add :requested_in_gaylord_count, :integer, null: false
        add :picked_up_gaylord_count, :integer
        add :delivered_gaylord_count, :integer
        add :requested_in_new_goods, :integer, null: false
        add :delivered_new_goods, :integer, null: false
        add :requested_out_large_item_count, :integer, null: false
        add :comment_large_item_id, references(:comments, on_delete: :delete_all)
        add :picked_up_large_item_count, :integer
        add :user_estimated_delivery_at, :datetime
        add :system_estimated_delivery_at, :datetime
        add :delivered_at, :datetime
        add :accepted_by_store_representative, :string, size: 50
      timestamps(type: :timestamptz)
    end

    create index(:request, [:request_id])
    create index(:location, [:location_id])
    create index(:accounts_user, [:user_id])
    create index(:accounts_user, [:driver_id])
    create index(:time_of_day, [:requested_time_of_day_id])
    create index(:comments, [:request_comment_id])
    create index(:comments, [:trailer_condition_comment_id])
    create index(:comments, [:comment_large_item_id])
    
  end
  
end