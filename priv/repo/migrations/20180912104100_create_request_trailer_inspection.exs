defmodule GW.Repo.Migrations.Request.Trailer.Inspection. do
    use Ecto.Migration
  
    def change do
       create table(:request_trailer_inspection) do
          add :request_id, references(:request, on_delete: :delete_all), null: false
          add :inspection_type_id, references(:request_trailer_inspection_type, on_delete: :delete_all), null: false
          add :user_id, references(:accounts_user, on_delete: :delete_all), null: false
          add :trailer_id, references(:trailer, on_delete: :delete_all), null: false
          add :preferred_vendor_location_id, references(:location, on_delete: :delete_all)
          add :due_on, :date, null: false
          add :occured_at, :date
          add :trailer_location_id, references(:location, on_delete: :delete_all)
          add :performed_by_user_id, references(:accounts_user, on_delete: :delete_all)
          add :performed_by_name, :string, size: 50
          add :inspection_comment_id, references(:comment, on_delete: :delete_all)
        timestamps(type: :timestamptz)
      end

      create index(:request, [:request_id])
      create index(:request_trailer_inspection_type, [:inspection_type_id])
      create index(:accounts_user, [:user_id])
      create index(:trailer, [:trailer_id])
      create index(:location, [:preferred_vendor_location_id])
      create index(:location, [:trailer_location_id])
      create index(:comment, [:inspection_comment_id])


    end
    
  end
