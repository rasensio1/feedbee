class PlacePresenter < SimpleDelegator
  def initialize(place)
    super
    @thing = place
  end

  def class
    "Place"
  end

  def display_address
    address || Address.new
  end

  def my_lat
    lat || "?"
  end

  def my_lng
    lng || "?"
  end
end
