defmodule GW.Repo.Migrations.CreateGW.History.Trailer.Content do
    use Ecto.Migration
  
    def change do
      create table(:history_trailer_content) do
        add :trailer_id, references(:trailer, on_delete: :delete_all), null: false
        add :trailer_content_type_id, (:trailer_content_type, on_delete: :delete_all), null: false
        add :user_id, references(:accounts_user, on_delete: :delete_all), null: false
      timestamps(type: :timestamptz)
    end

    create index(:trailer, [:trailer_id])
    create index(:trailer_content_type, [:trailer_content_type_id])
    create index(:accounts_user, [:user_id])

  end
  
end