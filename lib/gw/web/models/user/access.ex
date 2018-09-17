# defmodule GW.Access do
#   use Ecto.Schema
#   import Ecto.Changeset
#   alias  GW.{Repo}
#   alias __MODULE__

#   @derive {Poison.Encoder, only: [:id, :access_type]}

#   schema "access" do
#     field :access_type, :string

#     many_to_many :role, GW.Role,
#       join_through: "role_access"

#     timestamps(type: :utc_datetime)
#   end

#   @doc false
#   def changeset(%Access_Type{} = role, attrs) do
#     role
#     |> cast(attrs, [:access_type])
#   end

# end