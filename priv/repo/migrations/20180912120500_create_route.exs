defmodule GW.Repo.Migrations.CreateGW.Route do
    use Ecto.Migration

      def change do
        create table(:route) do
          add :person_driver_id, references(:person, on_delete: :delete_all), null: false
          add :planned_start_at, :datetime, null: false
          add :planned_end_at, :datetime, null: false
          add :actual_start_at, :datetime, null: false
          add :actual_end_at, :datetime, null: false
          add :starting_trailer_id, references(:trailer, on_delete: :delete_all), null: false
          add :actual_starting_odometer, :"double precision"
          add :route_comment_id, references(:comment, on_delete: :delete_all)
          add :created_by_user_id, references(:user, on_delete: :delete_all), null: false
         timestamps(type: :timestamptz)
      end

      create index(:route, [:person_driver_id])
      create index(:route, [:starting_trailer_id])
      create index(:route, [:route_comment_id])
      create index(:route, [:created_by_user_id])

    end

  end
