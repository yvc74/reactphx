# defmodule GW.Role.User do
#     use Ecto.Schema
#     import Ecto.Changeset
#     import Ecto.Query
#     alias __MODULE__
#     alias  GW.{Users, Roles}
  
#     schema "role_user" do
#       belongs_to :user, Users
#       belongs_to :role, Roles
        
#       timestamps(type: :utc_datetime)
#     end
  
#     @doc """
#     Creates a changeset based on the `model` and `params`.
  
#     If no params are provided, an invalid changeset is returned
#     with no validation performed.
#     """
#     def changeset(%RoleUser{} = role_user, attrs \\ :empty) do
#       role_user
#       |> cast(attrs, [:user_id, :role_id])
#       |> validate_required([:user_id, :role_id])
#       |> foreign_key_constraint(:role_id)
#       |> foreign_key_constraint(:user_id)
#     end
  
#     @doc " might not need this section --- figure out what workspace is doing"
#     def find_by_workspace_and_user(query \\ %RoleUser{}, role_id, user_id) do
#       from u in query, where: u.user_id == ^user_id and u.role_id == ^role_id
#     end
#   end
  