defmodule EcommerceWeb.Live.User do
  use EcommerceWeb, :live_view

  alias EcommerceWeb.UserView

  alias Ecommerce.Accounts
  alias Ecommerce.Accounts.User

  require Logger

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(changeset: Accounts.signup_user(%User{}))
      |> assign(password_value: "")
      |> assign(open_modal_signup: false)
      |> assign(open_modal_forgot_password: false)

    {:ok, socket}
  end

  def handle_params(_params, _url, socket) do
    # Live Action atoms
    live_action = socket.assigns.live_action

    case live_action do
      :signup ->
        {:noreply,
          socket
          |> assign(open_modal_signup: true)
          |> assign(open_modal_forgot_password: false)
        }
      :forgot_password ->
        {:noreply,
          socket
          |> assign(open_modal_signup: false)
          |> assign(open_modal_forgot_password: true)
        }
      _ ->
        {:noreply,
          socket
          |> assign(open_modal_signup: false)
          |> assign(open_modal_forgot_password: false)
        }
    end
  end

  # Validate registration forms
  def handle_event("validate-registration", %{"user" => params}, socket) do
    changeset =
      %User{}
      |> Accounts.signup_user(params)
      |> Map.put(:action, :validate)

    password_value =
      cond do
        is_nil(Map.get(changeset.changes, :password)) or changeset.changes == %{}  -> ""
        true -> changeset.changes.password
      end

    {:noreply,
      socket
      |> assign(changeset: changeset)
      |> assign(password_value: password_value)
    }
  end

  # Save users
  def handle_event("save", _params, socket) do
    {:noreply, socket}
  end

  #==> push_patch: update socket without destroying it
  #==> push_redirect: destroy socket and mount a new one

  # Open modal SignUp
  def handle_event("open-modal-signup", _params, socket) do
    {:noreply,
      socket
      |> assign(open_modal_signup: true)
      |> push_patch(to: Routes.user_path(socket, :signup))
    }
  end

  # Close modal SignUp
  def handle_event("close-modal-signup", _params, socket) do
    {:noreply,
      socket
      |> assign(open_modal_signup: false)
      |> push_patch(to: Routes.user_path(socket, :signin))
    }
  end

  # Open modal Forgot Password
  def handle_event("open-modal-forgot-password", _params, socket) do
    {:noreply,
      socket
      |> assign(open_modal_forgot_password: true)
      |> push_patch(to: Routes.user_path(socket, :forgot_password))
    }
  end

  # Close modal Forgot Password
  def handle_event("close-modal-forgot-password", _params, socket) do
    {:noreply,
      socket
      |> assign(open_modal_forgot_password: false)
      |> push_patch(to: Routes.user_path(socket, :signin))
    }
  end

  def render(assigns) do
    UserView.render("user_signin.html", assigns)
  end
end
