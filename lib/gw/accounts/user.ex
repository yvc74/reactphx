defmodule GW.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias GW.Accounts.User

  @derive {Poison.Encoder, only: [:id, :firstname, :last_name, :email]}

  schema "accounts_user" do
    field :firstname, :string
    field :lastname, :string
    field :username, :string
    field :email, :string
    field :encrypted_password, :string
    field :time_zone_id, :integer
    field :home_location_id, :integer
    field :password, :string, virtual: true

    belongs_to :role, GW.Role.User

    has_many :time_entries, GW.TimeBoundries.TimeEntry
    has_many :comments, GW.Comment
    has_many :history_adc_trailer_status, GW.History.Adc.Trailer.Status
    has_many :history_store_request_status_update, GW.History.Store.Request.Status.Update
    has_many :history_trailer_content, GW.History.Trailer.Content
    has_many :history_trailer_service_request_status, GW.History.Trailer.Service.Request.Status
    has_many :history_trailer_status, GW.History.Trailer.Status
    has_many :user_images, GW.Image.User
    has_many :images, GW.Image
    has_many :location_primary_contact_user, GW.Location
    has_many :request_trailer_inspection, GW.Request.Trailer.Inspection

    many_to_many :role, GW.Role,
      join_through: "role_user"

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:firstname, :lastname, :email, :password])
    |> validate_required([:firstname, :email, :password])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 5)
    |> unique_constraint(:email, message: "Email already taken")
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
        _->
        current_changeset
    end
  end
end
