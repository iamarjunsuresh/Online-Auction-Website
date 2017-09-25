class AdminController < ApplicationController
  before_action :require_admin,:require_login
  def index

@livea=Product.where(:auction_status=>"AUCTION_LIVE")
@users=User.where(:verified_by=>-1)
@products=Product.where(:verified_by=>-1)
 @userp=[]

 @products.each do |x|
 	y=User.find(x.seller_id)
@userp.push({name:y.name,id:y.id})

end
@pr=Product.where(:auction_status=>'TO_BE_VERIFIED')

 
  end

  def makeadmin

    if(params[:id].nil? or params[:id]=="")

        redirect_to controller:"admin",action:"index"
        return
    end
      p=User.find(params[:id])
      p.usertype='admin'
      p.save

        a=Admin.new
        a.email=p.email
        a.name=p.email
        a.pass=""
        a.save
        redirect_to action:"index"
  end

def banuser


if(session[:isadmin]==1)

    s=User.find(params[:id])
    s.verified_by=-3
    s.save
end
  redirect_to controller:"main",action:"index"



end

def vwproduct
@r=Product.all
end
def vwuser
@users=User.all

	end
  def vproduct
if params[:id].nil? or params[:id]==""
  redirect_to action:"index"

end
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
if params[:id].nil? or params[:id]==""
  redirect_to action:"index"
  return
end
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
  if params[:id].nil? or params[:id]==""
  redirect_to action:"index"
  return

end
  ds=params[:id]
  @p=Product.find(ds)
  @p.auction_status="SCHEDULED"
  @p.save
aid=@p.auction_id
  @a=Auction.find(aid)
	@a.status="SCHEDULED"
	@a.admin_id=session[:userdata]["id"]
	@a.save

redirect_to controller:"admin",action:"index"
return
  end

  def vauction 

  	

  end


end
