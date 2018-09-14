defmodule GW.Models.Comments.Comment do
    use Ecto.Schema
    import Ecto.Changeset
    alias GW.Models.Comment.Comment

    schema "comment" do
        field :comment_text, :string

        belongs_to :comment_type, GW.Models.Comments.CommentType
        belongs_to :user, GW.Models.Accounts.User

        has_many :request_trailer_serivce, GW.Models.Requests.RequestTrailerService, [foreign_key: :request_comment_id]
        has_many :request_trailer_serivce, GW.Models.Requests.RequestTrailerService, [foreign_key: :trailer_condition_comment_id]
        has_many :request_trailer_serivce, GW.Models.Requests.RequestTrailerService, [foreign_key: :comment_large_item_id]
        has_many :request_trailer_inspection, GW.Models.Requests.RequestTrailerInspection, [foreign_key: :inspection_comment_id]
        has_many :request_unintended_donation, GW.Models.Requests.RequestUnintendedDonation, [foreign_key: :dsc]
        has_many :history_trailer_inspection, GW.Models.History.HistoryTrailerInspection, [foreign_key: :inspection_comment_id]
        has_many :route, GW.Models.Routes.Route, [foreign_key: :route_comment_id]
        has_many :route_segment, GW.Models.Routes.RouteSegment, [foreign_key: :route_segment_comment_id]
        has_many :trailer_lease_agreement, GW.Models.Trailers.TrailerLeaseAgreement, [foreign_key: :lease_trailer_condition_comment_id]
        has_many :request_trailer_maintenance, GW.Model.Requests.RequestTrailerMaintenance, [foreign_key: :trailer_condition_comment_id]
        has_many :request_trailer_maintenance, GW.Model.Requests.RequestTrailerMaintenance, [foreign_key: :maintenance_comment_id]

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
