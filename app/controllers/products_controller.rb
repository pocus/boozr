require 'open-uri'

class ProductsController < ApplicationController
  def index
  	page = params[:yip] || 1
  	products_json = open("http://lcboapi.com/products?page=#{page}").read
  	@products = JSON.parse(products_json) #@products is a hash
  end

  def show
  	id = params[:id]
  	product_json = open("http://lcboapi.com/products/#{id}").read
  	@product = JSON.parse(product_json)
  end

end