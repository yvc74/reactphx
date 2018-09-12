defmodule GW.Repo.Migrations.CreateGW.Routes do
    use Ecto.Migration
  
      def change do
        create table(:routes) do
          add :driver_id, references(:accounts_user, on_delete: :delete_all), null: false
          add :planned_start_at, :datetime, null: false
          add :planned_end_at, :datetime, null: false
          add :actual_start_at, :datetime, null: false
          add :actual_end_at, :datetime, null: false
          add :starting_trailer_id, references(:trailers, on_delete: :delete_all), null: false
          add :actual_starting_odometer, :float, precision: 15
          add :route_comment_id, references(:comment, on_delete: :delete_all)
          add :created_by_user_id, references(:accounts_user, on_delete: :delete_all), null: false 
         timestamps(type: :timestamptz)
      end

      create index(:accounts_user, [:driver_id])
      create index(:trailers, [:starting_trailer_id])
      create index(:comment, [:route_comment_id])
      create index(:accounts_user, [:created_by_user_id])
      
    end
    
  end