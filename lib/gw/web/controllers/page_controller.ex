defmodule GW.Web.PageController do
  use GW.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
