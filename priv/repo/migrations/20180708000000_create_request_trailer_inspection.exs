defmodule GW.Repo.Migrations.CreateGW.Request.Trailer.Inspection do
    use Ecto.Migration

      def change do
        create table(:request_trailer_inspection) do
          add :request_id, references(:request, on_delete: :delete_all), null: false
          add :inspection_type_id, references(:request_trailer_inspection_type, on_delete: :delete_all), null: false
          add :user_id, references(:user, on_delete: :delete_all), null: false
          add :trailer_id, references(:trailer, on_delete: :delete_all), null: false
          add :preferred_vendor_location_id, references(:location, on_delete: :delete_all)
          add :due_on, :date, null: false
          add :occured_at, :date
          add :trailer_location_id, references(:location, on_delete: :delete_all)
          add :performed_by_person_id, references(:person, on_delete: :delete_all)
          add :inspection_comment_id, references(:comment, on_delete: :delete_all)
          timestamps(type: :timestamptz)
      end

        create index(:request_trailer_inspection, [:performed_by_person_id])
        create index(:request_trailer_inspection, [:request_id])
        create index(:request_trailer_inspection, [:inspection_type_id])
        create index(:request_trailer_inspection, [:user_id])
        create index(:request_trailer_inspection, [:trailer_id])
        create index(:request_trailer_inspection, [:preferred_vendor_location_id])
        create index(:request_trailer_inspection, [:trailer_location_id])
        create index(:request_trailer_inspection, [:inspection_comment_id])
  end

 end



