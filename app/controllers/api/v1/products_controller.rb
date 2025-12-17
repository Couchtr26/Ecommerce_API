module Api
  module V1
    class ProductsController < ApplicationController
      def index
        @q = Products.ransack(params[:q])
        @products = @q.result.paginate(page: params[:page], per_page: 10)
        render json: @products, meta: {
          current_page: @products.current_page,
          total_pages: @products.total_pages,
          total_entries: @products.total_entries
          }
      end

      def create
        @product = Product.new(product_params)
        if @product.save
          ProcessProductJob.perform_later(@product.id)
          render json: @product, status: :created
        else
          render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private
      def product_params
        params.require(:product).permit(:name, :description, :price, :category_id)
      end
    end
  end
end
