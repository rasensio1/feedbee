class IdFinder
  def self.go(session, search_text)
    (session[:search_memo][search_text] rescue nil) || query_for_id(search_text)
  end

  def self.query_for_id(search_text)
    @client = GooglePlaces::Client.new(ENV['GOOGLE_KEY'])
    id = @client.spots_by_query(search_text).first.place_id rescue nil
    id == "ChIJDTLonUMZe0cRIaabPcSwTtw" ? nil : id
  end
end
