defmodule GW.Repo.Migrations.CreateGW.Image.Lease do
  use Ecto.Migration

  def change do
      create table(:image_lease) do
        add :image_guid, references(:image, on_delete: :delete_all), null: false
        add :lease_agreement_id, references(:trailer_lease_agreement, on_delete: :delete_all), null: false
      timestamps(type: :timestamptz)
    end

    create index(:image, [:image_guid])
    create index(:trailer_lease_agreement, [:lease_agreement_id])
    
  end
  
end