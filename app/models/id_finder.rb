class IdFinder
  def self.go(session, search_text)

    if !session[:search_memo]
      session[:search_memo] = Autocompleter.api_results(search_text)
    end

    result = (session[:search_memo][search_text.downcase] rescue nil) || session[:search_memo].values.flatten
    result = nil if result.blank?
    result
  end
end
