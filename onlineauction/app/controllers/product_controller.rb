class ProductController < ApplicationController

  
  def index
    check("/product/")
    id=session[:userdata]["id"]
    @r=Product.where(:seller_id=>id)


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

    @labels=["Title","Description","Minimum Bid"]

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
@prod.category=params[:category]
  @prod.seller_id=session[:userdata]["id"]
  @prod.save
  redirect_to action:"create"
  end
 #noerror
end
end
  def show

  id=params[:id]
@us=Product.find(id)
@arrmap=[]
@arrmap={"AUCTION_LIVE"=>"Auction is Live" ,"AUCTION_END"=>"Auction  Ended" ,"SCHEDULED"=>"Auction  Scheduled","TO_BE_VERIFIED"=>"Auction Verification Pending","None"=>"Not Available for Auction"}
  @p=Product.find(params[:id])
  if @p.auction_status.eql?("None")
@issch=1
  else
@issch=0
  end
@labels=["Description","Minimum Bid","Sold By"]
@seller=User.find(@p.seller_id)
#@names=["name","desc","minbid"]    

@pname=@p.name
@vals=[]
 # @vals.push @p.name
  @vals.push @p.description
  @vals.push @p.min_bid
  @vals.push @seller.name
  @vals.push @p.id
  end

  def edit
  @category=Category.all
@p=Product.find(params[:id])
@labels=["Name of Item","Description","Minimum Bid"]

    @names=["name","desc","minbid"] 
   
  @vals=[]
  @vals.push @p.name
  @vals.push @p.description
  @p.category=params[:category]
  @vals.push @p.min_bid

if(request.method=="POST")

  @p.name=params[:name]
@p.description=params[:desc]
@p.min_bid=params[:minbid].to_f
 
@pim=@p.image
if(not params[:pimage].nil?)
uploaded_io = params[:pimage]
randomisepath=rand(99999).to_s+rand(99999).to_s+uploaded_io.original_filename
  File.open(Rails.root.join('public', 'uploads', randomisepath), 'wb') do |file|
    file.write(uploaded_io.read)
  end
@p.image="/uploads/"+randomisepath
end
@p.save
redirect_to action:"index"
end

  end

  def delete

@p=Product.find(params[:id])
@p.destroy
redirect_to action:"index"
  end

def schedule

st=params[:starttime]
et=params[:endtime]
pid=params[:id]

  @pp=Product.find(pid)
a=ActiveSupport::TimeZone["Asia/Kolkata"].parse(st)
b=ActiveSupport::TimeZone["Asia/Kolkata"].parse(et)
  

  @pp.start_time=a

  @pp.end_time=b

  @pp.auction_status="TO_BE_VERIFIED"


  @auc=Auction.new
  @auc.start_time=@pp.start_time
  @auc.end_time=@pp.end_time
  @auc.admin_id=-1
  @auc.status="TO_BE_VERIFIED"
  @auc.pid=pid
  @auc.save
  @pp.auction_id=@auc.id
  @pp.save
redirect_to action:"show",id:pid

end
def cancel

a=Product.find(params[:id])
b=Auction.find(a.auction_id)
b.status="None"
b.save
a.auction_status="None";
a.save
redirect_to action:"show",id:params[:id]
  end
end
