defmodule GW.Repo.Migrations.Request.Type do
    use Ecto.Migration
  
    def change do
      create table(:request_type) do
        add :request_type_name, :string, size: 75, null: false
      timestampstz()
      end
      
    end

  end