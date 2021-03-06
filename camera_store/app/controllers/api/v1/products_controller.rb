class Api::V1::ProductsController < ApplicationController
  before_action :permit_all_params
  def index
    product = Product.all
    render json: {status: 'SUCCESS', message: 'Product loaded Successful', data:products}
  end
  
  def show
    product = Product.find(params[:id])
    render json: {status: 'SUCCESS', message: 'Product loaded Successful', data:product}
  end

  def show_products
    products = Product.where(category_id: params[:id])
    render json: {status: 'SUCCESS', message: 'Product loaded Successful', data:products}
  end  


  def create
    product = Product.new(product_params)
    # debugger
    if product.save
      render json: {status: 'SUCCESS', message: 'Product Saved Successful', data:product}  
    else
      render json: {status: 'ERROR', message: 'Product Saved Unsuccessful', data:product}
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    render json: {status: 'SUCCESS', message: 'Product destroyed Successful', data:product}
  end
  
  def update
    product = Product.find(params[:id]) 
    if product.update_attributes(product_params)
      render json: {status: 'SUCCESS', message: 'Product update Successful', data:product}
    else
      render json: {status: 'ERROR', message: 'Product update Unsuccessful', data:product}
    end
  end
:id

  private

  def product_params  
    params.permit(:name, :category_id, :description, :price, :make)
  end  

  def permit_all_params
    params.permit!

  end


end	