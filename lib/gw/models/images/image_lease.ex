defmodule GW.Models.Images.ImageLease do
  use Ecto.Schema
  import Ecto.Changeset
  alias GW.Models.{
    Images.Image
    Requests.Request
  }


  schema "image_lease" do

    belongs_to :image, Image, [foreign_key: :image_guid, type: :string]
    belongs_to :request, Request

    timestamps(type: :utc_datetime)
  end

  def new(image_lease, params \\ %{}) do
    image_lease
    |> cast(params, [:image_guid, :request_id])
    |> validate_required([:image_guid, :request_id])
  end

  def edit(image_lease, params \\ %{}) do
    image_lease
    |> cast(params, [:id, :image_guid, :request_id])
    |> validate_required([:id, :image_guid, :request_id])
  end

  def delete(image_lease, params \\ %{}) do
    image_lease
    |> cast(params, [:id,])
    |> validate_required([:id,])
  end
end
