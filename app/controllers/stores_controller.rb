class StoresController < ApplicationController
  def index
  	page = params[:dip] || 1
  	stores_json = open("http://lcboapi.com/stores?page=#{page}").read
    @stores = JSON.parse(stores_json)
  end

  def show
  	id = params[:id]
  	store_json = open("http://lcboapi.com/stores/#{id}").read
  	@store = JSON.parse(store_json)

	 	elev_json = open("http://maps.googleapis.com/maps/api/elevation/json?sensor=false&locations=#{@store['result']['latitude']},#{@store['result']['longitude']}").read
		@store_elev = JSON.parse(elev_json)

  end


end
