defmodule GW.Repo.Migrations.Web.Models.Trailers.TrailerMake do
    use Ecto.Migration
  
    def change do
        create table(:trailer_make) do
          add :trailer_make_name, :string, size: 75, null: false
        timestamps(type: :timestamptz)
    end

  end
  
end