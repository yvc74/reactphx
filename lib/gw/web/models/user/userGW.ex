# defmodule GW.User do
#   use Ecto.Schema
#   import Ecto.Changeset
#   alias GW.User

#   @derive {Poison.Encoder, only: [:id, :person_id ]}

#   schema "user" do
#     field :encrypted_password, :string
    
#     field :password, :string, virtual: true
    
#     belongs_to :person, GW.Person, foreign_key: :person_id

#     timestamps(type: :utc_datetime)
#   end

#   @doc false
#   def changeset(%User{} = user, attrs) do
#     user
#     |> cast(attrs, [:password, :person_id ])
#     |> validate_required([:password, :person_id])
#     |> validate_format(:password, ^(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!#$&%*_+-=?|])[^*();'`"]{8,24}$)
#     |> foreign_key_constraint(:person_id)
#     |> unique_constraint(:person, message: "This person already has a user account.")

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
