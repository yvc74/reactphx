defmodule GW.Web.PageControllerTest do
  use GW.Web.ConnCase

  test "GET /", %{conn: conn} do
    _conn = get conn, "/"
    #assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
