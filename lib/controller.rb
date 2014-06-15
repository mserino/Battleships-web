require 'sinatra'
require_relative 'ship'
require_relative 'coordinate'

enable :sessions

set :views, Proc.new { File.join(root, '..', "views")}

get '/' do
	@ship = Ship.new([Coordinate.new('A1')])
	session[:ship] = @ship
	erb :index
end

post '/place_ship' do
	@coordinate = Coordinate.new(params[:coordinates])
	@ship = Ship.new([@coordinate])
	session[:ship]= @ship
	session[:coordinate]= @coordinate
	erb :index
end

post '/shoot' do
	if session[:ship].can_be_hit_at? Coordinate.new(params[:shooting])
		session[:ship].hit(Coordinate.new(params[:shooting]))
	else
		puts "Missed!"
	end
	erb :index
end

__END__
	@ship = Ship.new(params[:coordinates])
	session[:ship]= @ship
