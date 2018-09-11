defmodule GW.Repo.Migrations.CreateGW.Comment.Type do
    use Ecto.Migration
  
    def change do
      create table(:comment_type) do
        add :comment_type_name, :string, size: 75, null:false
      timestampstz()
      end
  
    end
  end