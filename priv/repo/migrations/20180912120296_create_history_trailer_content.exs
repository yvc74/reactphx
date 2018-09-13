defmodule GW.Repo.Migrations.CreateGW.History.Trailer.Content do
    use Ecto.Migration

    def change do
      create table(:history_trailer_content) do
        add :trailer_id, references(:trailer, on_delete: :delete_all), null: false
        add :trailer_content_type_id, references(:trailer_content_type, on_delete: :delete_all), null: false
        add :person_id, references(:person, on_delete: :delete_all), null: false
      timestamps(type: :timestamptz)
    end

    create index(:history_trailer_content, [:trailer_id])
    create index(:history_trailer_content, [:trailer_content_type_id])
    create index(:history_trailer_content, [:person_id])

  end

end
