class Autocompleter
  def self.api_results(search_text)
    @client = GooglePlaces::Client.new(ENV['GOOGLE_KEY'])
    results = @client.predictions_by_input(search_text)
    organize(results)
  end

  def self.organize(results)
    results.reduce(Hash.new([].freeze)) do |agg, place|
      agg[name(place)] += [place.place_id]
      agg
    end
  end

  def self.name(place)
    place.terms.first["value"]
  end
end
