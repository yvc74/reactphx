defmodule GW.Repo.Migrations.Request.Trailer.Inspection. do
    use Ecto.Migration
  
    def change do
       create table(:request_trailer_inspection) do
         add :request_id, references(:requests, on_delete: :delete_all), null: false
         add :inspection_type_id, references(:request_trailer_inspection_type, on_delete: :delete_all), null: false
         add :user_id, references(:users, on_delete: :delete_all), null: false
         add :trailer_id, references(:trailers, on_delete: :delete_all), null: false
         add :preferred_vendor_location_id, references(:locations, on_delete: :delete_all)
         add :due_on, :date, null: false
         add :occured_at, :date
         add :trailer_location_id, references(:locations, on_delete: :delete_all)
         add :performed_by_user_id, references(:users, on_delete: :delete_all)
         add :performed_by_name, :string, size: 50
         add :inspection_comment_id, references(:comments, on_delete: :delete_all)
        timestampstz()
      end

      create index(:requests, [:request_id])
      create index(:request_trailer_inspection_type, [:inspection_type_id])
      create index(:users, [:user_id])
      create index(:trailers, [:trailer_id])
      create index(:locations, [:preferred_vendor_location_id])
      create index(:locations, [:trailer_location_id])
      create index(:comments, [:inspection_comment_id])


    end
    
  end