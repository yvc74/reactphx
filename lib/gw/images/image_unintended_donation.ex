# defmodule GW.Models.Images.ImageUnintendedDonation do
#   use Ecto.Schema
#   import Ecto.Changeset
#   alias GW.Models.{
#     Images.Image,
#     Requests.Request
#   }


#   schema "image_unintended_donation" do

#     belongs_to :image, Image, [foreign_key: :image_guid, type: :string]
#     belongs_to :request, Request

#     timestamps(type: :utc_datetime)
#   end

#   def new(image_unintended_donation, params \\ %{}) do
#     image_unintended_donation
#     |> cast(params, [:image_guid, :request_id])
#     |> validate_required([:image_guid, :request_id])
#   end

#   def edit(image_unintended_donation, params \\ %{}) do
#     image_unintended_donation
#     |> cast(params, [:id, :image_guid, :request_id])
#     |> validate_required([:id, :image_guid, :request_id])
#   end

#   def delete(image_unintended_donation, params \\ %{}) do
#     image_unintended_donation
#     |> cast(params, [:id,])
#     |> validate_required([:id,])
#   end
# end
