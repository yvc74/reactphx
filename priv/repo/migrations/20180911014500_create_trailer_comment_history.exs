defmodule GW.Repo.Migrations.CreateGW.Trailer.Comment.History do
    use Ecto.Migration
  
    def change do
        create table(:trailer_comment_history) do
            add :trailer_id, references(:trailers, on_delete: :delete_all), null: false
            add :comment_id, references(:comments, on_delete: :delete_all), null: false
          timestampstz()
    end

    create index(:trailers, [:trailer_id])
    create index(:comments, [:comment_id])

  end
  
end