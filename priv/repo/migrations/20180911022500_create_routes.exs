defmodule GW.Repo.Migrations.CreateGW.Routes do
    use Ecto.Migration
  
    def change do
       create table(:routes) do
   
        timestampstz()
      end

    end
    
  end