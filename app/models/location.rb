class Location < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  def address
    [comuna, region, "Chile"].compact.join(', ')
  end
end
