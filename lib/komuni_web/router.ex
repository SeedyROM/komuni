defmodule KomuniWeb.Router do
  use KomuniWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug KomuniWeb.APIAuthPlug, otp_app: :komuni
  end

  pipeline :api_protected do
    plug Pow.Plug.RequireAuthenticated, error_handler: KomuniWeb.APIAuthErrorHandler
  end

  scope "/api/v1", KomuniWeb.API.V1, as: :api_v1 do
    pipe_through :api

    resources "/registration", RegistrationController, singleton: true, only: [:create]
    resources "/session", SessionController, singleton: true, only: [:create, :delete]
    post "/session/renew", SessionController, :renew
  end

  scope "/api/v1", KomuniWeb.API.V1, as: :api_v1 do
    pipe_through [:api, :api_protected]

    # Your protected API endpoints here
  end
end
