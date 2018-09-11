defmodule GW.Repo.Migrations.CreateGW.Image.Lease do
    use Ecto.Migration
  
    def change do
        create table(:image_lease) do
          add :image_guid, references(:images, on_delete: :delete_all), null: false
          add :lease_agreement_id, references(:trailer_lease_agreement, on_delete: :delete_all), null: false
        timestampstz()
    end

    create index(:images, [:image_guid])
    create index(:trailer_lease_agreement, [:lease_agreement_id])
    
  end
  
end