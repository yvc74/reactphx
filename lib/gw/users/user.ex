defmodule GW.Users.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias GW.Users.User

  @derive {Poison.Encoder, only: [:id, :username]}

  schema "user" do
    field :username, :string
    field :encrypted_password, :string
    field :password, :string, virtual: true

    has_many :time_entries, GW.TimeBoundries.TimeEntry

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :password])
    |> validate_required([:password])
    |> validate_length(:password, min: 5)
    |> generate_encrypted_password
  end

  defp generate_encrypted_password(current_changeset) do
    case current_changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(
          current_changeset,
          :encrypted_password,
          Comeonin.Bcrypt.hashpwsalt(password)
        )
      _ ->
        current_changeset
    end
  end
end
