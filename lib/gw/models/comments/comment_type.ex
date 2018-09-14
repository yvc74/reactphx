defmodule GW.Models.Comments.CommentType do
  use Ecto.Schema
  import Ecto.Changeset
  alias GW.Models.Comments.CommentType

  schema "comment_type" do
      field :comment_type_name, :string

      has_many :comment, GW.Models.Comments.Comment

      timestamps()
  end
end
