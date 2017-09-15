class SessionController < ApplicationController
  def new
  end

  def create
    if user = authenticate_via_google
      cookies.signed[:user_id] = user.id
      redirect_to user
    else
      redirect_to new_session_url, alert: "authentication_failed"
    end
  end

  private
    def authenticate_via_google
      if params[:google_id_token].present?
        User.find_by google_id: GoogleSignIn::Identity.new(params[:google_id_token]).user_id
      end
    end
end
