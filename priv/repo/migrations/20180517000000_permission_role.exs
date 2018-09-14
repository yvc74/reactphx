defmodule GW.Repo.Migrations.Web.Models.User.PermissionRole do
  use Ecto.Migration

  def change do
    create table(:permission_role) do
      add :permission_id, references(:permission, on_delete: :delete_all), null: false
      add :role_id, references(:role, on_delete: :delete_all), null: false
    timestamps(type: :timestamptz)
  end
end

      # create index(:permission_role, [:permission_id])
      # create index(:permission_role, [:role_id])

end
git
