defmodule GW.Repo.Migrations.CreateGW.Route.Segments do
    use Ecto.Migration
  
    def change do
       create table(:route_segments) do
         add :route_id, references(:routes, on_delete: :delete_all), null: false
         add :sequence_number, :integer, null: false
         add :trailer_request_id, references(:trailer_request, on_delete: :delete_all), null: false
         add :planned_pick_up_at, :datetime, null: false
         add :from_location_id, references(:locations, on_delete: :delete_all), null: false
         add :planned_drop_off_at, :datetime, null: false
         add :to_location_id, references(:locations, on_delete: :delete_all), null: false
         add :actual_picked_up_at, :datetime, null: false
         add :actual_dropped_off_at, :datetime, null: false
         add :actual_ending_odometer, :float, precision: 15
         add :route_segment_comment_id, references(:comments, on_delete: :delete_all)
        timestampstz()
      end

      create index(:routes, [:route_id])
      create index(:trailers, [:trailer_request_id])
      create index(:locations, [:from_location_id])
      create index(:comments, [:route_comment_id])
      create index(:users, [:created_by_user_id])
      
    end
    
  end