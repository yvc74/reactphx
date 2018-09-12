defmodule GW.Repo.Migrations.CreateGW.Trailer.Make do
    use Ecto.Migration
  
    def change do
        create table(:trailer_make) do
          add :trailer_make_name, :string, size: 75, null: false
        timestampstz()
    end

  end
  
end