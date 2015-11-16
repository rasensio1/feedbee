class IdFinder
  def self.go(session, search_text)
    set_search_results(session, search_text)
    direct_match?(session, search_text) || all_memo_ids(session)
  end

  def self.direct_match?(session, search_text)
    res = session[:search_memo][search_text.downcase]
    res = nil if res.blank?
    res
  end

  def self.all_memo_ids(session)
    res = session[:search_memo].values.flatten
    res = nil if res.blank?
    res
  end

  def self.set_search_results(session, search_text)
    if !session[:search_memo]
      session[:search_memo] = Autocompleter.api_results(search_text)
    end
  end
end
