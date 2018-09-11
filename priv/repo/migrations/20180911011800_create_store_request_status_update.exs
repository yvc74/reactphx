defmodule GW.Repo.Migrations.CreateGW.Store.Request.Status.Update do
    use Ecto.Migration
  
    def change do
        create table(:store_request_status_update) do
          add :user_id, references(:users, on_delete: :delete_all), null: false
          add :location_id, references(:locations, on_delete: :delete_all), null: false
        timestampstz()
    end

    create index(:users [:user_id])
    create index(:locations [:location_id])

  end
  
end