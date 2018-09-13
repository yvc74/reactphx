defmodule GW.Repo.Migrations.CreateGW.Route.Segment do
    use Ecto.Migration
  
      def change do
        create table(:route_segment) do
          add :route_id, references(:route, on_delete: :delete_all), null: false
          add :sequence_number, :integer, null: false
          add :request_id, references(:request, on_delete: :delete_all), null: false
          add :planned_pick_up_at, :datetime, null: false
          add :from_location_id, references(:location, on_delete: :delete_all), null: false
          add :planned_drop_off_at, :datetime, null: false
          add :to_location_id, references(:location, on_delete: :delete_all), null: false
          add :actual_picked_up_at, :datetime, null: false
          add :actual_dropped_off_at, :datetime, null: false
          add :actual_ending_odometer, :float, precision: 15
          add :route_segment_comment_id, references(:comment, on_delete: :delete_all)
        timestamps(type: :timestamptz)
      end

      create index(:route, [:route_id])
      create index(:request, [:request_id])
      create index(:location, [:from_location_id])
      create index(:comment, [:route_segment_comment_id])
      create index(:location, [:to_location_id])
      
    end
    
  end
