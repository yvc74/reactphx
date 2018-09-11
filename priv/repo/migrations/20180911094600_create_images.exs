defmodule GW.Repo.Migrations.CreateGW.Images do
    use Ecto.Migration
  
    def change do
       create table(:images, primary_key: false) do
         add :image_guid, :string, size: 255, primary_key: true, null: false
         add :user_id, references(:users, on_delete: :delete_all), null: false     
        timestampstz()
      end

      create index(:users, [:user_id])

    end
    
  end