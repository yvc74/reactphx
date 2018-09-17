defmodule GW.Repo.Migrations.Web.Models.Requests.RequestUnintendedDonation do
    use Ecto.Migration

    def change do
        create table(:request_unintended_donation, primary_key: false) do
          add :request_id, references(:request, on_delete: :delete_all), primary_key: true, null: false
          add :location_id, references(:location, on_delete: :delete_all), null: false
          add :donor_id, references(:person, on_delete: :delete_all), null: false
          add :donated_at, :utc_datetime, null: false
          add :trailer_percent_full_estimate, :integer, null: false
          add :trailer_id, references(:trailer, on_delete: :delete_all), null: false
          add :entered_by_user_id, references(:user, on_delete: :delete_all), null: false
          add :entered_at, :utc_datetime, null: false
          add :reported_by_person_id, references(:person, on_delete: :delete_all), null: false
          add :found_at, :utc_datetime
          add :returned_at, :utc_datetime
          add :dsc, references(:comment, on_delete: :delete_all)
        timestamps(type: :timestamptz)
    end

    create index(:request_unintended_donation, [:request_id])
    create index(:request_unintended_donation, [:donor_id])
    create index(:request_unintended_donation, [:location_id])
    create index(:request_unintended_donation, [:trailer_id])
    create index(:request_unintended_donation, [:entered_by_user_id])
    create index(:request_unintended_donation, [:reported_by_person_id])
    create index(:request_unintended_donation, [:dsc])

  end

end
