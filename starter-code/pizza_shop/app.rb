class PizzaShop < Sinatra::Base

	#index
	get '/index' do
		@pizza = Pizza.all
		content_type :json
		@pizza.to_json
	end

	#show
	get '/index/:id' do
		@targetID = params["id"].to_i
		@pizza = Pizza.find(@targetID)
		content_type :json
		@pizza.to_json
	end

	#create
	post '/index' do
		request.body.rewind
		request_body = request.body.read
		parsed = JSON.parse(request_body)
		Pizza.create(parsed)
	end

	#update

	put '/index/:id' do
		request.body.rewind
		request_body = request.body.read
		parsed = JSON.parse(request_body)
		Pizza.update_attributes(parsed)
	end

	#delete
	delete '/index/:id' do
		@targetID = params["id"].to_i
		@pizza = Pizza.destroy(@targetID)
		content_type :json
		@pizza.to_json
	end

end
