defmodule GW.RoleAccess do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  alias __MODULE__
  alias  GW.{Role, Access}

  schema "role_access" do
    belongs_to :role, GW.Role
    belongs_to :access, GW.Access

    timestamps(type: :utc_datetime)
  end

  @doc """
  Creates a changeset based on the `model` and `params`.
  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(%RoleAccess{} = role_access, attrs \\ :empty) do
    role_access
    |> cast(attrs, [:access_id, :role_id])
    |> validate_required([:access_id, :role_id])
    |> foreign_key_constraint(:role_id)
    |> foreign_key_constraint(:access_id)
  end

  def find_by_role_and_access(query \\ %RoleAccess{}, role_id, access_id) do
    from a in query, where: a.access_id == ^access_id and a.role_id == ^role_id
  end

  def insert_role_access(changeset) do
    role_id = changeset.model.role_id
    access_id = changeset.model.access_id
    role_access_changeset = RoleAccess.changeset(
      %RoleAccess{}, %{role_id: role_id, access_id: access_id}
    )

    Repo.insert!(role_access_changeset)

    changeset
  end
end
  