class PictureAssotiationsController < ApplicationController
  before_filter :ensure_admin
  
  def create
  	product = Product.find(params[:product_id])
    image = Picture.find(params[:image_id])
    assotiation = product.build_picture_assotiation(picture_id: image.id)
    # @cart_item = @cart.add_product(product.id)#CartItem.new(params[:cart_item])

    respond_to do |format|
      if assotiation.save
        format.html { redirect_to products_path, notice: 'Image has been set' }
        format.json { render json: @cart_item, status: :created, location: @cart_item }
      else
        format.html { redirect_to pictures_path }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end
end
