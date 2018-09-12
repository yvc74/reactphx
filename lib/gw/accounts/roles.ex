# defmodule GW.Accounts.Roles do
#     use Ecto.Schema
#     import Ecto.Changeset
#     alias GW.Accounts.Roles

#     schema "accounts_roles" do
#         field :role_title, :string

#         many_to_many :users, GW.Users, join_through: "user_roles"

#         timestamps()
#     end

#     @doc false
#     # def changeset() do
#     # end
  