class AuctionController < ApplicationController
	def show_error

		if session[:em].nil?

			@msg=[]
		else
			@msg=session[:em]
		end
		session[:em]=nil
	end
  def create
  	
  	@labels=["Name of Item","Description","Minimum Bid"]

  	@names=["name","desc","minbid"]
  	@val=[]
  	if not session[:p].nil?
  		@val.push session[:p]["name"]
	  	@val.push session[:p]["desc"]
	  	@val.push session[:p]["minbid"]
  	end
  	
  	show_error()
  	if(request.method=="POST")
@err=[]

if(params[:name].empty? or params[:desc].empty? or params[:minbid].empty?)

	@err.push 'Fields cannot be empty'

end
if(params[:pimage].nil?)
	@err.push 'Upload an Image for Product'
end

if @err.size>0
	session[:em]=@err
	session[:p]=params
	redirect_to action:"create"

else
	session[:p]=nil
@prod=Product.new
@prod.name=params[:name]
@prod.desc=params[:desc]
@prod.min_bid=params[:minbid].to_f

uploaded_io = params[:pimage]
randomisepath=rand(99999).to_s+rand(99999).to_s+uploaded_io.original_filename
	File.open(Rails.root.join('public', 'uploads', randomisepath), 'wb') do |file|
  	file.write(uploaded_io.read)
  end
  @prod.image="/uploads/"+randomisepath
  @prod.verified_by=-1
  @prod.auction_status="None"

  @prod.seller_id=session[:userdata]["id"]
  @prod.save
  redirect_to action:"create"
  end
 #noerror
end

#post
end
#method

end