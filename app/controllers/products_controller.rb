require 'open-uri'

class ProductsController < ApplicationController
  def index
  	page = params[:yip] || "/products?page=1"

    if params[:search]
      products_json = open("http://lcboapi.com/#{page}&q=#{params[:search]}").read
    else
      products_json = open("http://lcboapi.com/#{page}").read
    end

    @products = JSON.parse(products_json)



  end

  def show
  	id = params[:id]
  	product_json = open("http://lcboapi.com/products/#{id}").read
  	@product = JSON.parse(product_json)

    product_inventory_json = open("http://lcboapi.com/products/#{id}/stores").read
    @product_inventory = JSON.parse(product_inventory_json)

  end

end