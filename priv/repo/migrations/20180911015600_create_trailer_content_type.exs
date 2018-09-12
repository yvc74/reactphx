defmodule GW.Repo.Migrations.CreateGW.Trailer.Content.Type do
    use Ecto.Migration
  
    def change do
      create table(:trailer_content_type) do
        add :trailer_content_type_name, :string, size: 75, null:false
      timestampstz()
      end
  
    end
  end