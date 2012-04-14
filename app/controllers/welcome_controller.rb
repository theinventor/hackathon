class WelcomeController < ApplicationController

  def index
    @user = User.fetch(session[:access_token]) if session[:access_token]

  end

  def callback

    response = RestClient.post("https://#{ApplicationHelper::CLIENT_ID}:#{ApplicationHelper::CLIENT_SECRET}@#{ApplicationHelper::MHEALTH_CONNECT}/access_token.json", {
      :grant_type => "authorization_code",
      :code => params[:code],
      :redirect_uri => ApplicationHelper::REDIRECT_URI
    })

    session[:access_token] = JSON.parse(response)["access_token"]

    redirect_to "/"

  end


end
