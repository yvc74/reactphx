defmodule GW.Repo.Migrations.Trailers.TrailerInvoiceDetail do
    use Ecto.Migration
  
    def change do
        create table(:trailer_invoice_detail) do
            add :image_guid, references(:image, column: :image_guid, type: :string, on_delete: :delete_all), null: false
            add :invoice_number, :string, size: 75, null: false
            add :invoice_date, :date, null: false
            add :invoice_total, :"double precision", null: false
            add :vendor_id, references(:location, on_delete: :delete_all), null: false
            add :request_id, references(:request, on_delete: :delete_all), null: false
        timestamps(type: :timestamptz)
    end

        create index(:trailer_invoice_detail, [:vendor_id])
        create index(:trailer_invoice_detail, [:image_guid])
        create index(:trailer_invoice_detail, [:request_id])

  end
  
end
