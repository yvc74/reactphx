defmodule GW.Repo.Migrations.CreateGW.Comment.Type do
    use Ecto.Migration
  
    def change do
        create table(:image_unintended_donation) do
          add :image_guid, references(:images, on_delete: :delete_all), null: false
          add :unintended_donation_id, references(:unintended_donation, on_delete: :delete_all), null: false    
        timestampstz()
    end

    create index(:images, [:image_guid])
    create index(:unintended_donation, [:unintended_donation_id])

  end
  
end