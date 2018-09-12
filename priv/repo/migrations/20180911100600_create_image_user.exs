defmodule GW.Repo.Migrations.CreateGW.Image.User do
    use Ecto.Migration
  
    def change do
        create table(:image_user) do
          add :image_guid, references(:images, on_delete: :delete_all), null: false
          add :user_id, references(:accounts_user, on_delete: :delete_all), null: false     
        timestamps(type: :timestamptz)
      end

      create index(:images, [:image_guid])
      create index(:accounts_user, [:user_id])
      
    end
    
  end