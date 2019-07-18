defmodule PiersmanacomWeb.PageController do
  use PiersmanacomWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html", site_domain: "piersmana.com", stripe_publishable_key: "pk_live_mYTmtjhmb0mmh3ZB5ryeMpbm")
  end

  def success(conn, _params) do
    render(conn, "success.html", site_domain: "piersmana.com")
  end

  def canceled(conn, _params) do
    render(conn, "canceled.html", site_domain: "piersmana.com")
  end

  def checkout(conn, _params) do
    {:ok, session} = Stripe.Session.create(%{
    payment_method_types: ["card"],
    subscription_data: [%{
      items: [%{plan: "lp3"}],
      trial_period_days: 1,
    }],
    success_url: "https://www.piersmana.com/success",
    cancel_url: "https://www.piersmana.com/cancel"
    })
    json(conn, %{stripe_checkout_session_id: session.id})
  end
end
