defmodule GW.Repo.Migrations.Web.Models.Trailers.TrailerContentType do
    use Ecto.Migration
  
    def change do
        create table(:trailer_content_type) do
          add :trailer_content_type_name, :string, size: 75, null: false
        timestamps(type: :timestamptz)
      end
  
    end
  end