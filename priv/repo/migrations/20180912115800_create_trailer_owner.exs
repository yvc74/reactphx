defmodule GW.Repo.Migrations.CreateGW.Trailer.Owner do
    use Ecto.Migration
  
    def change do
        create table(:trailer_owner) do
          add :trailer_owner_name, :string, size: 75, null: false
          add :in_house, :boolean, null: false
        timestampstz()
    end

  end
  
end