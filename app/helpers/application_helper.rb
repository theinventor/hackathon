module ApplicationHelper

    #class Application < Rails::Application

      CLIENT_ID = "cool_test_app"                 # See https://att.mhealth.com/dev/apps
      CLIENT_SECRET = "Q1neXiRBEGuirVYEmVWBp8W1i5ehFzqfiJdU6AtW"           # See https://att.mhealth.com/dev/apps
      MHEALTH_CONNECT = "mhealth.att.com"          # mHealth Connect endpoint (probably won't change)
      MHEALTH_API = "http://api.dev.tfoundry.com/" # mHealth API endpoint (probably won't change)
      REDIRECT_URI = "http://localhost:9292/auth/callback" # Redirect URI to pass to mHealth Connect when user authorizes

    #end

  # def current_user

  # end

  # helper_method :current_user
end
