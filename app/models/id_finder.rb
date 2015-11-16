class IdFinder
  def self.go(session, search_text)
    result = (session[:search_memo][search_text] rescue nil) || session[:search_memo].values.flatten
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
