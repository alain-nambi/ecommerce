defmodule EcommerceWeb.Live.User do
  use EcommerceWeb, :live_view

  alias EcommerceWeb.UserView

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    case assigns.live_action do
      :signin -> UserView.render("signin.html", assigns)
      _ -> UserView.render("signup.html", assigns)
    end
  end
end
