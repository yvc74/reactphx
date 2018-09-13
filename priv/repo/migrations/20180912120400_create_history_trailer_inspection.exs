defmodule GW.Repo.Migrations.CreateGW.History.Trailer.Inspection do
    use Ecto.Migration

    def change do
      create table(:history_trailer_inspection) do
        add :trailer_id, references(:trailer, on_delete: :delete_all), null: false
        add :inspection_type_id, references(:request_trailer_inspection_type, on_delete: :delete_all), null: false
        add :person_id, references(:person, on_delete: :delete_all), null: false
        add :preferred_vendor_location_id, references(:location, on_delete: :delete_all)
        add :due_on, :date, null: false
        add :occured_at, :datetime
        add :location_id, references(:location, on_delete: :delete_all)
        add :performed_by_name, :string, size: 50
        add :inspection_comment_id, references(:comment, on_delete: :delete_all)
      timestamps(type: :timestamptz)
    end

    create index(:history_trailer_inspection, [:trailer_id])
    create index(:history_trailer_inspection, [:inspection_type_id])
    create index(:history_trailer_inspection, [:person_id])
    create index(:history_trailer_inspection, [:preferred_vendor_location_id])
    create index(:history_trailer_inspection, [:location_id])
    create index(:history_trailer_inspection, [:inspection_comment_id])

  end

end
