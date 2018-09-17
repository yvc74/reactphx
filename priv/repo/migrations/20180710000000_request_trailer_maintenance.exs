defmodule GW.Repo.Migrations.Requests.RequestTrailerMaintenance do
    use Ecto.Migration

    def change do
        create table(:request_trailer_maintenance, primary_key: false) do
          add :request_id, references(:request, on_delete: :delete_all), primary_key: true, null: false
          add :maintenance_type_id, references(:request_trailer_maintenance_type, on_delete: :delete_all), null: false
          add :location_id, references(:location, on_delete: :delete_all), null: false
          add :user_id, references(:user, on_delete: :delete_all), null: false
          add :trailer_id, references(:trailer, on_delete: :delete_all), null: false
        timestamps(type: :timestamptz)
    end
        create index(:request_trailer_maintenance, [:maintenance_type_id])
        create index(:request_trailer_maintenance, [:request_id])
        create index(:request_trailer_maintenance, [:user_id])
        create index(:request_trailer_maintenance, [:trailer_id])
        create index(:request_trailer_maintenance, [:location_id])
        

  end

end
