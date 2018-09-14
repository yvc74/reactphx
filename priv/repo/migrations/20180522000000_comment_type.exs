defmodule GW.Repo.Migrations.Web.Models.Comments.CommentType do
    use Ecto.Migration
  
    def change do
      create table(:comment_type) do
        add :comment_type_name, :string, size: 75, null: false
      timestamps(type: :timestamptz)
    end
  
  end
end