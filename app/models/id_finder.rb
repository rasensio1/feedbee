class IdFinder
  def self.go(session, search_text)

    if !session[:search_memo]
      session[:search_memo] = Autocompleter.api_results(search_text)
    end

    result = (session[:search_memo][search_text.downcase] rescue nil) || session[:search_memo].values.flatten
    result = nil if result.blank?
    result
  end

  def self.query_for_id(search_text)
    @client = GooglePlaces::Client.new(ENV['GOOGLE_KEY'])
    ids = @client.spots_by_query(search_text)
    ids = ids.first.place_id rescue nil
    id == "ChIJDTLonUMZe0cRIaabPcSwTtw" || id.nil? ? nil : [id]
  end
end
