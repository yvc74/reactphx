defmodule GW.Repo.Migrations.CreateGW.Route do
    use Ecto.Migration
  
      def change do
        create table(:route) do
          add :driver_id, references(:user, on_delete: :delete_all), null: false
          add :planned_start_at, :datetime, null: false
          add :planned_end_at, :datetime, null: false
          add :actual_start_at, :datetime, null: false
          add :actual_end_at, :datetime, null: false
          add :starting_trailer_id, references(:trailer, on_delete: :delete_all), null: false
          add :actual_starting_odometer, :float, precision: 15
          add :route_comment_id, references(:comment, on_delete: :delete_all)
          add :created_by_user_id, references(:user, on_delete: :delete_all), null: false 
         timestamps(type: :timestamptz)
      end

      create index(:user, [:driver_id])
      create index(:trailer, [:starting_trailer_id])
      create index(:comment, [:route_comment_id])
      create index(:user, [:created_by_user_id])
      
    end
    
  end
