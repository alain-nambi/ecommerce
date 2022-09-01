defmodule EcommerceWeb.Live.Component.User.Signup do
  use Phoenix.LiveComponent

  alias EcommerceWeb.UserView

  def render(assigns) do
    UserView.render("user_signup.html", assigns)
  end
end
