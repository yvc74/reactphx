defmodule GW.Repo.Migrations.CreateGW.History.Trailer.Status do
    use Ecto.Migration
  
    def change do
      create table(:history_trailer_status) do
        add :trailer_id, references(:trailer, on_delete: :delete_all), null: false
        add :trailer_status_id, references(:trailer_status, on_delete: :delete_all), null: false
        add :user_id, references(:user, on_delete: :delete_all), null: false
      timestamps(type: :timestamptz)
    end

    create index(:trailer, [:trailer_id])
    create index(:trailer_status, [:trailer_status_id])
    create index(:user, [:user_id])

  end
  
end