# defmodule GW.Person do
#   use Ecto.Schema
#   import Ecto.Changeset
#   alias GW.{ Person, Time.Zone, Location }

#   @derive {Poison.Encoder, only: [:id, :firstname, :lastname, :username, :email, :phone_number, :time_zone_id ]}

#   schema "person" do
#     field :firstname, :string
#     field :lastname, :string
#     field :username, :string
#     field :email, :string 
#     field :phone_number, :string
    
#     belongs_to :time_zone, Time.Zone
#     belongs_to :location, Location
    
#     has_one :user, through: [:user]

#     has_many :time_entries, GW.TimeBoundries.TimeEntry
#     has_many :comment, GW.Comment
#     has_many :history_adc_trailer_status, GW.History.Adc.Trailer.Status
#     has_many :history_store_request_status_update, GW.History.Store.Request.Status.Update
#     has_many :history_trailer_content, GW.History.Trailer.Content
#     has_many :history_trailer_service_request_status, GW.History.Trailer.Service.Request.Status
#     has_many :history_trailer_status, GW.History.Trailer.Status
#     has_many :user_image, GW.Image.User
#     has_many :image, GW.Image
#     has_many :location_primary_contact_user, GW.Location
#     has_many :request_trailer_inspection, GW.Request.Trailer.Inspection
    
#     many_to_many :address, GW.Address,
#       join_through: "person_address"

#     timestamps(type: :utc_datetime)
#   end

#   @doc false
#   def changeset(%User{} = user, attrs) do
#     user
#     |> cast(attrs, [:username, :email, :password, :time_zone_id, :person_id ])
#     |> validate_required([:username, :email, :password, :time_zone_id, :person_id])
#     |> validate_format(:username, ~r/[a-z0-9]/, min: 5)
#     |> validate_format(:email, ~r/@/)
#     |> validate_length(:password, ^(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!#$&%*_+-=?|])[^*();'`"]{8,24}$)
#     |> unique_constraint(:username, message: "Username already taken")
#     |> foreign_key_constraint(:user_id)
#     |> foreign_key_constraint(:user_id)

#     |> generate_encrypted_password
#   end

#   defp generate_encrypted_password(current_changeset) do
#     case current_changeset do
#       %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
#         put_change(
#           current_changeset,
#           :encrypted_password,
#           Comeonin.Bcrypt.hashpwsalt(password)
#         )
#         _->
#         current_changeset
#     end
#   end
# end
