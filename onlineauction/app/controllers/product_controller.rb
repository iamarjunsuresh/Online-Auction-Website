class ProductController < ApplicationController

  
  def index
    check("/product/")
    id=session[:userdata]["id"]
    @r=Product.where(:seller_id=>id)


  end
  
  def show

  @p=Product.find(params[:id])
@labels=["Description","Minimum Bid","Sold By"]
@seller=User.find(@p.seller_id)
  #  @names=["name","desc","minbid"]    

  @vals=[]
 # @vals.push @p.name
  @vals.push @p.desc
  @vals.push @p.min_bid
  @vals.push @seller.name
    

  end

  def edit

@p=Product.find(params[:id])
@labels=["Name of Item","Description","Minimum Bid"]

    @names=["name","desc","minbid"]    

  @vals=[]
  @vals.push @p.name
  @vals.push @p.desc
  @vals.push @p.min_bid

if(request.method=="POST")

  @p.name=params[:name]
@p.desc=params[:desc]
@p.min_bid=params[:minbid].to_f

@pim=@p.image
if(not params[:image].nil?)
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

  def createauction

@p=Product.find(params[:id])


  end

  def cancelauction

@p=Product.find(params[:id])
  end

  def editauction

@p=Product.find(params[:id])
  end


end
