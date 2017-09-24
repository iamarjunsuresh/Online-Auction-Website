class AuctionController < ApplicationController


  def show
    id=params[:id]

    @p=Product.find(id)
    @auc=Auction.find(@p.auction_id)
    session[:aid]=@auc.id
    session[:pid]=@p.id
    session[:bid]=session[:userdata]["id"]
        @bids=Bidding_table.where(:auction_id=>@p.auction_id).order("biding_price DESC")
        @duration=((@auc.end_time-Time.now)*60*60*24).to_i;
@arr=@bids
if(@arr.size!=0)
  @bidwinval=@arr[0].biding_price
else
  @bidwinval=0
end
  end

def diffnow(st)
@r=DateTime.now()-DateTimestrptime(st,"%Y-%m-%d %H:%M:%S UTC")
@y=(@r*24*60*60)
  @y.to_i

end

  def diffdate(x,y)
@r=DateTime.strptime(x,"%Y-%m-%d %H:%M:%S UTC")-DateTime.strptime(y,"%Y-%m-%d %H:%M:%S UTC")
@y=(@r*24*60*60)
  @y.to_i
  end
def cancelbid
    id=params[:id]
    @bid=Bidding_table.find(id)
    @auc=Auction.find(session[:aid])
    percen=diffnow(@auc.start_time)/diffdate(@auc.end_time,@auc.start_time)
    puts(percen)
    if(percen>0.5)


@resp={message:"Bid Can't Be Cancelled after 50 percentage of time has passed"}

    elsif @bid.bidder_id=session[:bid]

      @bid.destroy

@resp={message:"Bid is Cancelled"}
      end
respond_to do |format|  ## Add this
  format.xml  { render :xml => @resp }
  format.json { render :json => @resp}  
end
end
  def placebid

    val=params[:val]
    @p=Product.find(session[:pid])
    @auc=Bidding_table.where(:auction_id=>@p.auction_id).order("biding_price DESC")
    if @p.auction_status.eql?("AUCTION_END")
      @resp={message:"Auction Ended"}
     elsif @auc.size!=0
         if val.to_f<=@auc[0].biding_price
          #return error less bid val

      @resp={message:"Bid Placed is Lower than Curently Bidding Price"}
         else 
          @bd=Bidding_table.new
            @bd.auction_id=session[:aid]
            @bd.prod_id=session[:pid]
            @bd.biding_price=val.to_f
            @bd.time=Time.now
            
            @bd.bidder_id=session[:bid]
            @bd.save

@resp={message:"Bid Placed Successfully1"}
        end
    else
            @bd=Bidding_table.new
            @bd.auction_id=session[:aid]
            @bd.prod_id=session[:pid]
            @bd.biding_price=val
            @bd.time=Time.now
            @bd.bidder_id=session[:bid]
            @bd.save

@resp={message:"Bid Placed Successfully"}
     end
  respond_to do |format|  ## Add this
  format.xml  { render :xml => @resp }
  format.json { render :json => @resp}  
end
  end

  

  def bidlist



    @resp=Bidding_table.where(:auction_id=>session[:aid]).order("biding_price DESC")
 @res=[]
    @resp.each do |i|
     
      @p=User.find(i.bidder_id)
      @res.push({bidid:i.id,name:@p.name,time:i.time,biding_price:i.biding_price})
    end
    respond_to do |format|  ## Add this
  format.xml  { render :xml => @res }
  format.json { render :json => @res}  
end

  end
	def show_error

		if session[:em].nil?

			@msg=[]
		else
			@msg=session[:em]
		end
		session[:em]=nil
	end
  def create
  	
    @category=Category.all
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
@prod.description=params[:desc]
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

def edit


  ds=params[:id]


    a=Auction.find(ds)
if(request.method=="GET")
  @startt=a.start_time
  @endt=a.end_time
else
    a.status="SCHEDULED"
    a.start_time=params[:starttime]
    a.end_time=params[:endtime]
    a.save
end



end


  def cancel
ds=params[:id]
a=Auction.find(ds)
a.status="AUCTION_CANCELLED"
a.save
redirect_to action:"index"

  end
#method

end