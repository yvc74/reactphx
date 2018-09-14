defmodule GW.Repo.Migrations.Web.Models.Requests.RequestType do
    use Ecto.Migration
  
    def change do
      create table(:request_type) do
        add :request_type_name, :string, size: 75, null: false
      timestamps(type: :timestamptz)
      end
      
    end

  end