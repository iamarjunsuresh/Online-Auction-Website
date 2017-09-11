class MainController < ApplicationController

def setmessage
	if(session[:em].nil?)

		session[:em]=[]
		@msgarr=[]
		return
	else
		@msgarr=session[:em]
		session[:em]=[]
	end
end
def index
setmessage()

end

def login
@err=[]
	if (request.method=="GET" )
		#print form
		setmessage()
	elsif (request.method=="POST")
		#user authenticate
		if(params[:email].empty? or params[:password].empty?)
			@err.push("Fields can't be blank");
		end
		@email=params[:email]
		if(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/.match(@email).size==0)
			@err.push("Email InValid");

		end

		if(@err.size>0)

			session[:em]=@err
			redirect_to action:"login"

		else

			#check in db
		end

	end



end


def register
	@msgarr=[]


	if (request.method=="GET")
		setmessage()


	elsif (request.method=="POST")

		@err=[]

		n1=params[:fname]
		n2=params[:lname]
		ad=params[:addr]
		em=params[:email]
		ph=params[:mobno]
		pwd=params[:pwd]	
		if(n1.empty? or n2.empty? or ad.empty? or ph.empty? or em.empty? or pwd.empty?)
			@err.push('All Fields cannot be Empty')
		end
		if(ph.length!=10)
			@err.push("Mobile No Invalid");
			end
		if(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/.match(em).size==0)
			@err.push('Email is Invalid')
		end
		if(@err.size>0)
			session[:em]=@err

			redirect_to action:"register"
		end
		#insert to db


		
	end	
end	
def search 


end


end


