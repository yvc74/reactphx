defmodule GW.Repo.Migrations.CreateGW.History.Store.Request.Status.Update do
    use Ecto.Migration
  
    def change do
        create table(:history_store_request_status_update) do
          add :user_id, references(:user, on_delete: :delete_all), null: false
          add :location_id, references(:location, on_delete: :delete_all), null: false
        timestamps(type: :timestamptz)
    end

    create index(:user [:user_id])
    create index(:location [:location_id])

  end
  
end