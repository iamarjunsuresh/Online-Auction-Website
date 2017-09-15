class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def check(url)
     if (session[:userdata].nil?)
        @a=[]
        @a.push "Login to continue"
          session[:em]=@a
          session[:prevurl]=url
        redirect_to url 
    end
  end
end
