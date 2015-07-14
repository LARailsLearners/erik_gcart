class ProductsController < InheritedResources::Base

  before_action :authenticate_user!

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    @product.save
    redirect_to products_url
  end

  private

    def product_params
      params.require(:product).permit(:name, :description, :price)
    end
end

