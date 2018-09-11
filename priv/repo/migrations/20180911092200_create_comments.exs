defmodule GW.Repo.Migrations.CreateGW.Comment.Type do
    use Ecto.Migration
  
    def change do
      create table(:comments) do
        add :comment_type_id, references(:comment_type, on_delete: :delete_all), null: false
        add :user_id, references(:users, on_delete: :delete_all), null: false
        add :comment_text, :string, size: 750, null: false
      timestampstz()
      end

      create index(:comment_type, [:comment_type_id])
      create index(:users, [:user_id])
    end

  end