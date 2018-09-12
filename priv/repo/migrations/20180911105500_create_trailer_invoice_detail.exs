defmodule GW.Repo.Migrations.CreateGW.Trailer.Invoice.Detail do
    use Ecto.Migration
  
    def change do
        create table(:trailer_invoice_detail) do
            add :image_guid, references(:images, on_delete: :delete_all), null: false
            add :invoice_number, :string, size: 75, null: false
            add :invoice_date, :date, null: false
            add :invoice_total, :float, precision: 15, scale: 2, null: false
            add :request_id, references(:request, on_delete: :delete_all), null: false
        timestamps(type: :timestamptz)
    end

        create index(:images, [:image_guid])
        create index(:request, [:request_id])

  end
  
end