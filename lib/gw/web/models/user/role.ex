defmodule GW.Role do
  use Ecto.Schema
  import Ecto.Changeset
  alias  GW.{Repo}
  alias __MODULE__

  @derive {Poison.Encoder, only: [:id, :role_title]}

  schema "role" do
    field :role_title, :string

    many_to_many :access, GW.Access,
      join_through: "role_access"

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(%Role{} = role, attrs) do
    role
    |> cast(attrs, [:role_title])
  end

end