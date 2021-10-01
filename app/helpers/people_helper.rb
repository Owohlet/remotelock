require 'time'
module PeopleHelper
end

def get_full_city_name(abbr)
	cities = {
		LA: "Los Angeles",
		NYC: "New York City"
	}

	return cities[:"#{abbr}"] 
end

def format_date(date)
	return Time.parse(date).strftime("%-m/%-d/%Y")
end
