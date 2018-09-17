defmodule GW.Repo.Migrations.Web.Models.Requests.RequestTrailerService do
    use Ecto.Migration

    def change do
      create table(:request_trailer_service, primary_key: false) do
        add :request_id, references(:request, on_delete: :delete_all), primary_key: true, null: false
        add :location_id, references(:location, on_delete: :delete_all), null: false
        add :user_id, references(:user, on_delete: :delete_all), null: false
        add :requested_delivery_on, :date, null: false
        add :requested_time_of_day_id, references(:time_of_day, on_delete: :delete_all)
        add :requested_delivery_from, :utc_datetime
        add :requested_delivery_to, :utc_datetime
        add :request_comment_id, references(:comment, on_delete: :delete_all)
        add :trailer_condition_comment_id, references(:comment, on_delete: :delete_all)
        add :request_out_pallet_count, :integer, null: false
        add :request_in_pallet_count, :integer, null: false
        add :requested_out_blue_bin_count, :integer, null: false
        add :requested_in_blue_bin_count, :integer, null: false
        add :requested_out_gaylord_count, :integer, null: false
        add :requested_in_gaylord_count, :integer, null: false
        add :requested_in_new_goods, :integer, null: false
        add :requested_out_large_item_count, :integer, null: false
        add :comment_large_item_id, references(:comment, on_delete: :delete_all)
      timestamps(type: :timestamptz)
    end

    create index(:request_trailer_service, [:request_id])
    create index(:request_trailer_service, [:location_id])
    create index(:request_trailer_service, [:user_id])
    create index(:request_trailer_service, [:requested_time_of_day_id])
    create index(:request_trailer_service, [:request_comment_id])
    create index(:request_trailer_service, [:trailer_condition_comment_id])
    create index(:request_trailer_service, [:comment_large_item_id])

  end

end
