
get '/' do
	@destroyer  = Destroyer.new(Coordinates.new(Coordinate.new(" "), Coordinate.new(" ")))
	session[:destroyer] = @destroyer
	@cruiser  = Cruiser.new(Coordinates.new(Coordinate.new(" "), Coordinate.new(" ")))
	session[:cruiser] = @cruiser
	erb :index
end

# post '/place_ship' do
# 	@coordinate = Coordinate.new(params[:coordinates])
# 	@ship = Ship.new([@coordinate])
# 	session[:ship]= @ship
# 	session[:coordinate]= @coordinate
# 	erb :index
# end

post '/place_destroyer' do
	coord1 = Coordinate.new(params[:destroyer1])
	coord2 = Coordinate.new(params[:destroyer2])
	coords = Coordinates.new(coord1, coord2)
	if coords.valid?
		session[:destroyer] = Destroyer.new(coords)
	else
		@message_destroyer = "Invalid coordinates"
	end
	erb :index
end

post '/place_cruiser' do
	coord1 = Coordinate.new(params[:cruiser1])
	coord2 = Coordinate.new(params[:cruiser2])
	coord3 = Coordinate.new(params[:cruiser3])
	coords = Coordinates.new(coord1, coord2, coord3)
	if coords.valid?
		session[:cruiser] = Cruiser.new(coords)
	else
		@message_cruiser = "Invalid coordinates"
	end
	erb :index
end

# post '/shoot' do
# 	if session[:ship].can_be_hit_at? Coordinate.new(params[:shooting])
# 		session[:ship].hit(Coordinate.new(params[:shooting]))
# 	else
# 		puts "Missed!"
# 	end
# 	erb :index
# end

__END__
	@ship = Ship.new(params[:coordinates])
	session[:ship]= @ship