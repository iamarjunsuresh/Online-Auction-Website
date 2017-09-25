require 'date';
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


  def getdatefrompicker(datestr)

DateTime.strptime(datestr , "%Y/%m/%d %H:%M")

  end
  def checklogin

        if(session[:userdata].nil?)

          session[:prevurl]=original_url

          redirect_to controller:"main",action:"login" and return
        
              

        end

  end
  def original_url
    request.original_fullpath
end

  def isadmin


  end


 
  def require_login
    if session[:userdata].nil?
     redirect_to controller:"main",action:"login" # halts request cycle
      return
    end
   
  if session[:userdata]["verified_by"]==-3
    redirect_to controller:"main",action:"ban"

    return 
  end
    if session[:userdata]["verified_by"]<0 
    redirect_to controller:"main",action:"userverify"

    return 
  
    end




  



    end


    def require_admin
      if session[:isadmin].nil? or session[:isadmin]=0
          redirect_to controller:"main",action:"index"
      end
    end

end
