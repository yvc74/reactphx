defmodule GW.Models.Comments.Comment do
    use Ecto.Schema
    import Ecto.Changeset
    alias GW.Models.{
    Accounts.User,
    Comments.CommentType,
    Requests.RequestTrailerService,
    Requests.RequestTrailerInspection,
    Requests.RequestTrailerMaintenance,
    History.HistoryTrailerInspection,
    Routes.Route,
    Routes.RouteSegment,
    Trailers.TrailerLeaseAgreement}


    schema "comment" do
        field :comment_text, :string

        belongs_to :comment_type, CommentType
        belongs_to :user, User

        has_many :request_trailer_serivce, RequestTrailerService, [foreign_key: :request_comment_id]
        has_many :request_trailer_serivce, RequestTrailerService, [foreign_key: :trailer_condition_comment_id]
        has_many :request_trailer_serivce, RequestTrailerService, [foreign_key: :comment_large_item_id]
        has_many :request_trailer_inspection, RequestTrailerInspection, [foreign_key: :inspection_comment_id]
        has_many :request_unintended_donation, RequestUnintendedDonation, [foreign_key: :dsc]
        has_many :history_trailer_inspection, HistoryTrailerInspection, [foreign_key: :inspection_comment_id]
        has_many :route, Route, [foreign_key: :route_comment_id]
        has_many :route_segment, RouteSegment, [foreign_key: :route_segment_comment_id]
        has_many :trailer_lease_agreement, TrailerLeaseAgreement, [foreign_key: :lease_trailer_condition_comment_id]
        has_many :request_trailer_maintenance, RequestTrailerMaintenance, [foreign_key: :trailer_condition_comment_id]
        has_many :request_trailer_maintenance, RequestTrailerMaintenance, [foreign_key: :maintenance_comment_id]

        timestamps(type: :utc_datetime)
    end

    def new(comment, params \\ %{}) do
        comment
        |> cast(params, [:comment_text])
        |> validate_required([:comment_text])
      end

    def edit(comment, params \\ %{}) do
        comment
        |> cast(params, [:comment_text, :id])
        |> validate_required([:comment_text, :id])
      end

    def delete(comment, params \\ %{}) do
        comment
        |> cast(params, [:id])
        |> validate_required([:id])
    end

end
