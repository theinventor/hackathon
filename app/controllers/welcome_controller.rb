class WelcomeController < ApplicationController

  def index
    @user = User.fetch(access_token) if session[:access_token]

  end

  def callback

    response = RestClient.post("https://#{SlumberScore.setting(:client_id)}:#{SlumberScore.setting(:client_secret)}@#{SlumberScore.setting(:mhealth_connect)}/access_token.json", {
      :grant_type => "authorization_code",
      :code => params[:code],
      :redirect_uri => SlumberScore.setting(:redirect_uri)
    })

    session[:access_token] = JSON.parse(response)["access_token"]

    redirect_to "/"

  end


end
