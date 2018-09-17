defmodule GW.Models.Comments.CommentType do
  use Ecto.Schema
  import Ecto.Changeset
  alias GW.Models.Comments.Comment

  schema "comment_type" do
      field :comment_type_name, :string

      has_many :comment, Comment

      timestamps(type: :utc_datetime)
  end

  def new(comment_type, params \\ %{}) do
    comment_type_name
    |> cast(params, [:comment_type_name])
    |> validate_required([:comment_type_name])
  end

  def edit(comment_type, params \\ %{}) do
    comment_type_name
    |> cast(params, [:comment_type_name, :id])
    |> validate_required([:comment_type_name, :id])
  end

  def delete(comment_type, params \\ %{}) do
    comment_type_name
    |> cast(params, [:id])
    |> validate_required([:id])
  end


end
