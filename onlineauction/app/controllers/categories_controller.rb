class CategoriesController < ApplicationController

	def new
		@category=Category.new
    @cat=Category.all
	end

	def create
  @category = Category.new(category_params)
 
  if @category.save
    redirect_to action:"index"
  else
    render 'new'
  end
end

def index
	@category=Category.all
end
def delete
    

    @category = Category.find(params[:id])

    if(Product.where(:category=>@category.name).size==0)
    @category.destroy
  end
 
    redirect_to categories_path
  end
def show
	@category=Category.find(params[:id])
end 
private
  def category_params
    params.require(:category).permit(:name)
  end
end
