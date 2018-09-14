defmodule GW.Models.Images.ImageMaintenance do
  use Ecto.Schema
  import Ecto.Changeset
  alias GW.Models.{
    Images.Image
    Requests.Request
  }


  schema "image_maintenance" do

    belongs_to :image, Image, [foreign_key: :image_guid, type: :string]
    belongs_to :request, Request

    timestamps(type: :utc_datetime)
  end

  def new(image_maintenance, params \\ %{}) do
    image_maintenance
    |> cast(params, [:image_guid, :request_id])
    |> validate_required([:image_guid, :request_id])
  end

  def edit(image_maintenance, params \\ %{}) do
    image_maintenance
    |> cast(params, [:id, :image_guid, :request_id])
    |> validate_required([:id, :image_guid, :request_id])
  end

  def delete(image_maintenance, params \\ %{}) do
    image_maintenance
    |> cast(params, [:id,])
    |> validate_required([:id,])
  end
end
