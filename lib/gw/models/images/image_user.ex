defmodule GW.Models.Images.ImageUser do
  use Ecto.Schema
  import Ecto.Changeset
  alias GW.Models.{
    Images.Image,
    Accounts.User
  }


  schema "image_user" do

    belongs_to :image, Image, [foreign_key: :image_guid, type: :string]
    belongs_to :user, User

    timestamps(type: :utc_datetime)
  end

  def new(image_user, params \\ %{}) do
    image_user
    |> cast(params, [:image_guid, :user_id])
    |> validate_required([:image_guid, :user_id])
  end

  def edit(image_user, params \\ %{}) do
    image_user
    |> cast(params, [:image_guid, :user_id])
    |> validate_required([:image_guid, :user_id])
  end

  def delete(image_user, params \\ %{}) do
    image_user
    |> cast(params, [:id, :user_id])
    |> validate_required([:id, :user_id])
  end
end
