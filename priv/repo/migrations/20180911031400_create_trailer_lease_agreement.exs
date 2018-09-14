defmodule GW.Repo.Migrations.CreateGW.Trailer.Lease.Agreement do
    use Ecto.Migration
  
    def change do
        create table(:trailer_lease_agreement) do
          add :lessor_location_id, references(:location, on_delete: :delete_all), null: false
          add :trailer_id, references(:trailer, on_delete: :delete_all), null: false
          add :trailer_owner_id, references(:trailer_owner, on_delete: :delete_all), null: false
          add :lease_date, :date, null: false
          add :due_on, :date
          add :returned_on, :date
          add :lease_agreement_number, :string, size: 40, null: false
          add :pre_lease_landing_gear_cross_members_condition_id, references(:trailer_lease_condition_type, on_delete: :delete_all), null: false
          add :pre_lease_mud_flaps_condition_id, references(:trailer_lease_condition_type, on_delete: :delete_all), null: false
          add :pre_lease_icc_bumper_condition_id, references(:trailer_lease_condition_type, on_delete: :delete_all), null: false
          add :pre_lease_tires_conditon_id, references(:trailer_lease_condition_type, on_delete: :delete_all), null: false
          add :pre_lease_cargo_doors_condition_id, references(:trailer_lease_condition_type, on_delete: :delete_all), null: false
          add :pre_lease_lights_reflective_tape_condition_id, references(:trailer_lease_condition_type, on_delete: :delete_all), null: false
          add :pre_lease_roof_roof_bows_condition_id, references(:trailer_lease_condition_type, on_delete: :delete_all), null: false
          add :pre_lease_exterior_condition_id, references(:trailer_lease_condition_type, on_delete: :delete_all), null: false
          add :tire_size_id, references(:tire_size, on_delete: :delete_all), null: false
          add :lease_trailer_condition_comment_id, references(:comment, on_delete: :delete_all)
          add :lessor_employee_name, :string, size: 75
          add :shuttle_fee, :boolean
          add :lessee_driver_id, references(:user, on_delete: :delete_all)
        timestamps(type: :timestamptz)
    end

        create index(:location, [:lessor_location_id])
        create index(:trailer, [:trailer_id])
        create index(:trailer_owner, [:trailer_owner_id])
        create index(:trailer_lease_condition_type, [:pre_lease_landing_gear_cross_members_condition_id])
        create index(:trailer_lease_condition_type, [:pre_lease_mud_flaps_condition_id])
        create index(:trailer_lease_condition_type, [:pre_lease_icc_bumper_condition_id])
        create index(:trailer_lease_condition_type, [:pre_lease_tires_condition_id])
        create index(:trailer_lease_condition_type, [:pre_lease_cargo_doors_condition_id])
        create index(:trailer_lease_condition_type, [:pre_lease_lights_reflective_tape_condition_id])
        create index(:trailer_lease_condition_type, [:pre_lease_roof_roof_bows_condition_id])
        create index(:trailer_lease_condition_type, [:pre_lease_exterior_condition_id])
        create index(:tire_size, [:tire_size_id])
        create index(:comment, [:lease_trailer_condition_comment_id])
        create index(:user, [:lessee_driver_id])

  end
  
end