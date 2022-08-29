defmodule EcommerceWeb.Live.Home do
  use EcommerceWeb, :live_view

  alias EcommerceWeb.HomeView

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    HomeView.render("home.html", assigns)
  end
end
