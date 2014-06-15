require 'sinatra'
require_relative 'ships'
require_relative 'coordinates'

enable :sessions

set :views, Proc.new { File.join(root, '..', "views")}

get '/' do
	@ships ||= {}
	session[:ships] = @ships
	erb :index, :layout => :layout
end

post '/place_ships' do
	coord1 = Coordinate.new(" ")
	coord2 = Coordinate.new(" ")
	session[:ships][:destroyer] = Ship.new(Coordinates.new(coord1, coord2))
	erb :index
end

post '/login' do
	erb :login, :layout => :layout
end

get '/login' do
	erb :login, :layout => :layout
end

get '/destroyer' do
	erb :destroyer, :layout => :layout
end

post '/place_destroyer1' do
	d1 = Coordinate.new(params[:d1])
	d2 = Coordinate.new(params[:d2])
	session[:ships][:destroyer1] = Destroyer.new(Coordinates.new(d1,d2))
	erb :destroyer, :layout => :layout
end

post '/place_destroyer2' do
	d3 = Coordinate.new(params[:d3])
	d4 = Coordinate.new(params[:d4])
	session[:ships][:destroyer2] = Destroyer.new(Coordinates.new(d3, d4))
	erb :destroyer, :layout => :layout
end

get '/cruiser' do
	erb :cruiser, :layout => :layout
end

post '/place_cruiser1' do
	c1 = Coordinate.new(params[:c1])
	c2 = Coordinate.new(params[:c2])
	c3 = Coordinate.new(params[:c3])
	session[:ships][:cruiser1] = Cruiser.new(Coordinates.new(c1,c2,c3))
	erb :cruiser, :layout => :layout
end

post '/place_cruiser2' do
	c1 = Coordinate.new(params[:c4])
	c2 = Coordinate.new(params[:c5])
	c3 = Coordinate.new(params[:c6])
	session[:ships][:cruiser2] = Cruiser.new(Coordinates.new(c1,c2,c3))
	erb :cruiser, :layout => :layout
end