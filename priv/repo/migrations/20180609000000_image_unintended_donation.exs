defmodule GW.Repo.Migrations.Web.Models.Images.ImageUnintendedDonation do
    use Ecto.Migration
  
    def change do
        create table(:image_unintended_donation) do
          add :image_guid, references(:image, column: :image_guid, type: :string, on_delete: :delete_all), null: false
          add :request_id, references(:request, on_delete: :delete_all), null: false    
        timestamps(type: :timestamptz)
    end

    create index(:image_unintended_donation, [:image_guid])
    create index(:image_unintended_donation, [:request_id])

  end
  
end
