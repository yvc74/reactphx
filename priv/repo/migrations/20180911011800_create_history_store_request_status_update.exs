defmodule GW.Repo.Migrations.CreateGW.Store.Request.Status.Update do
    use Ecto.Migration

    def change do
        create table(:history_store_request_status_update) do
          add :person_id, references(:person, on_delete: :delete_all), null: false
          add :location_id, references(:location, on_delete: :delete_all), null: false
        timestamps(type: :timestamptz)
    end

    create index(:history_store_request_status_update, [:person_id])
    create index(:history_store_request_status_update, [:location_id])

  end

end
