defmodule GW.Repo.Migrations.CreateGW.Trailer.Content.History do
    use Ecto.Migration
  
    def change do
        create table(:trailer_content_history) do
          add :trailer_id, references(:trailers, on_delete: :delete_all), null: false
          add :trailer_content_type_id, (:trailer_content_type, on_delete: :delete_all), null: false
          add :user_id, references(:users, on_delete: :delete_all), null: false
        timestampstz()
    end

    create index(:trailers [:trailer_id])
    create index(:trailer_content_type, [:trailer_content_type_id])
    create index(:users, [:user_id])

  end
  
end