defmodule GW.Repo.Migrations.Images.ImageLease do
  use Ecto.Migration

  def change do
      create table(:image_lease) do
        add :image_guid, references(:image, column: :image_guid, type: :string, on_delete: :delete_all), null: false
        add :lease_agreement_id, references(:trailer_lease_agreement, on_delete: :delete_all), null: false
      timestamps(type: :timestamptz)
    end

    create index(:image_lease, [:image_guid])
    create index(:image_lease, [:lease_agreement_id])

  end

end
