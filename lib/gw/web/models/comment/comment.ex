# defmodule GW.Comments.Comment do
#     use Ecto.Schema
#     import Ecto.Changeset
#     alias GW.Comment.Comment

#     schema "comment_comment" do
#         field :, :string

#         many_to_many :users, GW.Users, join_through: "user_roles"

#         timestamps()
#     end

#     @doc false
#     # def changeset() do
#     # end
  