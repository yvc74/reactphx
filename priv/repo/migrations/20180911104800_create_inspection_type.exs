defmodule GW.Repo.Migrations.CreateGW.Comment.Type do
    use Ecto.Migration
  
    def change do
        create table(:inspection_type) do
          add :inspection_type_name, :string, size: 75, null: false
        timestampstz()
    end

  end
  
end