defmodule GW.Repo.Migrations.CreateGW.Request.Unintended.Donation do
    use Ecto.Migration
  
    def change do
        create table(:request_unintended_donation) do
          add :location_id, references(:locations, on_delete: :delete_all), null: false
          add :donor_first_name, :string, size: 100, null: false
          add :donor_last_name, :string, size: 100, null: false
          add :donor_phone, :string, size: 25, null: false
          add :donated_at, :datetime, null: false
          add :trailer_percent_full_estimate, :integer, null: false
          add :trailer_id, references(:trailers, on_delete: :delete_all), null: false
          add :entered_by_user_id, references(:accounts_user, on_delete: :delete_all), null: false
          add :entered_at, :datetime, null: false
          add :reported_by_user_id, references(:accounts_user, on_delete: :delete_all) null: false
          add :found_at, :datetime
          add :returned_at, :datetime
          add :dsc, references(:comments, on_delete: :delete_all) 
        timestamps(type: :timestamptz)
    end

    create index(:locations, [:location_id])
    create index(:trailers, [:trailer_id])
    create index(:accounts_user, [:entered_by_user_id])
    create index(:accounts_user, [:reported_by_user_id])
    create index(:comments, [:dsc])

  end
  
end