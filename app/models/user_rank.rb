class UserRank

  def self.rank(votes)
    if votes > 100
      { rank: "Absolutely Amazing",
        text: "Let me take you out to lunch as a way
        of saying 'Thank-you' for making this app great.
        Shoot me a text. (630) 408-1964   -Ryan" }
    elsif votes > 60
      { rank: "Game-Changer",
        text: "I'm impressed! Glad you like this app." }
    elsif votes > 30
      { rank: "Superb",
        text: "Keep it up, my friend" }
    elsif votes > 10
      { rank: "Journeyman",
        text: "Poke around a bit more! See if you can find any bugs and let me know." }
    else
      { rank: "Novice",
        text: "Look up some places you like or don't like and leave some feedback.
        let's try to make the world a little bit better" }
    end

  end

end
