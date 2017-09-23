class AdminController < ApplicationController
  def index

@users=User.where(:verified_by=>-1)
@products=Product.where(:verified_by=>-1)
 @userp=[]

 @products.each do |x|
 	y=User.find(x.seller_id)
@userp.push({name:y.name,id:y.id})

end
@pr=Product.where(:auction_status=>'TO_BE_VERIFIED')

 
  end

def vwproduct
@r=Product.all
end
def vwuser
@users=User.all

	end
  def vproduct

id=params[:id]
@a=Product.find(id)
if(params[:verified]=="0")
@a.verified_by=0
else
@a.verified_by=session[:userdata]["id"].to_i
end

@a.save
redirect_to action:"index"

  end

  def vuser

id=params[:id]
@a=User.find(id)
if(params[:verified]=="0")
@a.verified_by=0
else
@a.verified_by=session[:userdata]["id"].to_i
end
@a.save
redirect_to action:"index"

  end


def verifyauction
  ds=params[:id]
  @p=Product.find(ds)
  @p.auction_status="SCHEDULED_FOR_AUCTION"
  @p.save
aid=@p.auction_id
  @a=Auction.find(aid)
	@a.status="SCHEDULED"
	@a.admin_id=session[:userdata]["id"]
	@a.save

redirect_to controller:"admin",action:"index"

  end

  def vauction 

  	

  end


end
