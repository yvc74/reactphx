defmodule GW.Web.CurrentUserController do
  use GW.Web, :controller

  plug Guardian.Plug.EnsureAuthenticated, handler: GW.Web.SessionController

  def show(conn, _) do
    user = Guardian.Plug.current_resource(conn)

    conn
    |> put_status(:ok)
    |> render("show.json", user: user)
  end
end
