defmodule GW.Repo.Migrations.CreateGW.TimeBoundries.TimeEntry do
  use Ecto.Migration

    def change do
        create table(:time_boundries_time_entries) do
          add :description, :string
          add :started_at, :naive_datetime
          add :stopped_at, :naive_datetime
          add :restarted_at, :naive_datetime
          add :duration, :integer
          add :person_id, references(:person, on_delete: :delete_all)
        timestamps(type: :timestamptz)
    end

    create index(:time_boundries_time_entries, [:person_id])
  end
end
