defmodule GW.Repo.Migrations.CreateGW.Image.Unintended.Donation do
    use Ecto.Migration
  
    def change do
        create table(:image_unintended_donation) do
          add :image_guid, references(:image, on_delete: :delete_all), null: false
          add :request_id, references(:request, on_delete: :delete_all), null: false    
        timestamps(type: :timestamptz)
    end

    create index(:image, [:image_guid])
    create index(:request, [:request_id])

  end
  
end
