# app/helpers/session_helper.rb

module SessionHelper
  def get_state
    state = SecureRandom.hex(24)
    session['omniauth.state'] = state

    state
  end
end
