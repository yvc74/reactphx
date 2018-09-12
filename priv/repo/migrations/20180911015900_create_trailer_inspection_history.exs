defmodule GW.Repo.Migrations.CreateGW.Trailer.Inspection.History do
    use Ecto.Migration
  
    def change do
      create table(:trailer_inspection_history) do
        add :trailer_id, references(:trailers, on_delete: :delete_all), null: false
        add :inspection_type_id, references(:inspection_type, on_delete: :delete_all), null: false
        add :user_id, references(:accounts_user, on_delete: :delete_all), null: false
        add :preferred_vendor_location_id, references(:locations, on_delete: :delete_all)
        add :due_on, :date, null: false
        add :occured_at, :datetime
        add :location_id, references(:locations, on_delete: :delete_all)
        add :performed_by_name, :string, size: 50
        add :inspection_comment_id, references(:comment, on_delete: :delete_all)
      timestamps(type: :timestamptz)
    end

    create index(:trailers, [:trailer_id])
    create index(:inspection_type, [:inspection_type_id])
    create index(:accounts_user, [:user_id])
    create index(:locations, [:preferred_vendor_location_id])
    create index(:locations, [:location_id])
    create index(:comment, [:inspection_comment_id])

  end
  
end