defmodule GW.Models.Images.Image do
  use Ecto.Schema
  import Ecto.Changeset
  alias GW.Models.{
    Accounts.User,
    Images.Imageuser,
    Images.ImageUnintendedDonation,
    Images.ImageMaintenance,
    Images.LargePickup,
    Trailers.TrailerInvoiceDetail,
    Images.ImageLease
    Images.ImageAdcTrailerProgress
    }

  @primary_key {:image_guid, :string, []}

  schema "image" do

    belongs_to :user, User

    has_many :image_user, ImageUser, [foreign_key: :image_guid]
    has_many :image_unintended_donation, ImageUnintendedDonation, [foreign_key: :image_guid]
    has_many :image_maintenance, ImageMaintenance, [foreign_key: :image_guid]
    has_many :image_large_pickup, ImageLargePickup, [foreign_key: :image_guid]
    has_many :image_large_pickup, ImageLargePickup, [foreign_key: :image_guid]
    has_many :image_lease, ImageLease, [foreign_key: :image_guid]
    has_many :image_adc_trailer_progress, ImageAdcTrailerProgress [foreign_key: :image_guid]
    has_many :trailer_invoice_detail, TrailerInvoiceDetail, [foreign_key: :image_guid]


    timestamps(type: :utc_datetime)
  end

  def new(image, params \\ %{}) do
    image
    |> cast(params, [:image_guid, :user_id])
    |> validate_required([:image_guid, :user_id])
  end

  def edit(image, params \\ %{}) do
    image
    |> cast(params, [:image_guid, :user_id])
    |> validate_required([:image_guid, :user_id])
  end

  def delete(image, params \\ %{}) do
    image
    |> cast(params, [:image_guid, :user_id])
    |> validate_required([:image_guid, :user_id])
  end


end
