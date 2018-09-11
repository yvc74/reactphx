defmodule GW.Repo.Migrations.CreateGW.Image.User do
    use Ecto.Migration
  
    def change do
       create table(:image_user) do
         add :image_guid, references(:images, on_delete: :delete_all), null: false
         add :user_id, references(:users, on_delete: :delete_all), null: false     
        timestampstz()
      end

      create index(:images, [:image_guid])
      create index(:users, [:user_id])
      
    end
    
  end