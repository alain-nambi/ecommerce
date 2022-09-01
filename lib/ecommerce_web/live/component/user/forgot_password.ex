defmodule EcommerceWeb.Live.Component.User.ForgotPassword do
  use Phoenix.LiveComponent

  alias EcommerceWeb.UserView

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    UserView.render("user_forgot_password.html", assigns)
  end
end
