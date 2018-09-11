defmodule GW.Repo.Migrations.CreateGW.Comment.Type do
    use Ecto.Migration
  
    def change do
        create table(:invoice_detail) do
            add :image_guid, references(:images, on_delete: :delete_all), null: false
            add :invoice_number, :string, size: 75, null: false
            add :invoice_date, :date, null: false
            add :invoice_total, :float, precision: 15, scale: 2, null: false
            add :trailer_maintenance_request_id, references(:trailer_maintenance_request, on_delete: :delete_all), null: false
          timestampstz()
    end

        create index(:images, [:image_guid])
        create index(:trailer_maintenance_request, [:trailer_maintenance_request_id])

  end
  
end