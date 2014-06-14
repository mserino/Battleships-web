require_relative 'coordinate'

class Coordinates

  attr_reader :locations

  def initialize(*args)
    @locations = args.sort!
    raise 'Invalid coordinates' unless valid?
  end

  def valid?
    sequential_locations?
  end

  def count
    locations.count
  end

  def include? coordinate
    @locations.include? coordinate
  end

  def sequential_locations?
    return true if single_coordinate?
    !sequence.include?(false)
  end

  def sequence
    location_pairs.map do |coord_a, coord_b| 
      sequential_coordinates?(coord_a, coord_b)
    end
  end

  def sequential_coordinates?(coord_a, coord_b)
    coord_b.convert_to_number - coord_a.convert_to_number == 1
  end

  def location_pairs
    locations.each_cons(2)
  end

  def single_coordinate?
    locations.count == 1
  end

  def into_array
    locations.map {|coordinate| coordinate.location}
  end

end
