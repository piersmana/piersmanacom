defmodule PiersmanacomWeb.Router do
  use PiersmanacomWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PiersmanacomWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/success", PiersmanacomWeb do
    pipe_through :browser

    get "/", PageController, :success
  end

  scope "/canceled", PiersmanacomWeb do
    pipe_through :browser

    get "/", PageController, :canceled
  end

  scope "/checkout", PiersmanacomWeb do
    pipe_through :api

    post "/", PageController, :checkout
  end
end
