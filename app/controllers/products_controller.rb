class ProductsController < ApplicationController
def index
		 @products = Product.all
	end

	def show
       @product = Product.find(params[:id])
    end

	def new
		 @product = current_user.products.build
	end

	def create
		 @product = current_user.products.build(product_params)
		 if @product.save
			flash[:notice] = 'Product created!'
			redirect_to @product
		 else
			flash[:error] = 'Failed to edit this product!'
			render :new, status: :unprocessable_entity
		 end
	end

	def edit
		 @product = current_user.products.find(params[:id])
	end

	def update
		 @product = current_user.products.find(params[:id])
		 if @product.update(product_params)
		   flash[:notice] = 'Product updated!'
		   redirect_to @product
	 	 else
		   flash[:error] = 'Failed to update this product!'
		   render :edit, status: :unprocessable_entity
		 end
	end 

	def destroy
	    @product = current_user.products.find(params[:id])
       if @product.destroy
           flash[:notice] = 'Product deleted!'
	       redirect_to root_path, status: :see_other
       else
           flash[:error] = 'Failed to delete this product!'
           render products_path
        end
    end
       

	private

	def product_params
		params.require(:product).permit(:name, :price, :description, :image )
	end
end
