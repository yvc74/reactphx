defmodule GW.Repo.Migrations.CreateGW.Routes do
    use Ecto.Migration
  
    def change do
       create table(:routes) do
         add :driver_id, references(:users, on_delete: :delete_all), null: false
         add :planned_start_at, :datetime, null: false
         add :planned_end_at, :datetime, null: false
         add :actual_start_at, :datetime, null: false
         add :actual_end_at, :datetime, null: false
         add :starting_trailer_id, references(:trailers, on_delete: :delete_all), null: false
         add :actual_starting_odometer, :float, precision: 15
         add :route_comment_id, references(:comments, on_delete: :delete_all)
         add :created_by_user_id, references(:users, on_delete: :delete_all), null: false 
        timestampstz()
      end

      create index(:users, [:driver_id])
      create index(:trailers, [:starting_trailer_id])
      create index(:comments, [:route_comment_id])
      create index(:users, [:created_by_user_id])
      
    end
    
  end