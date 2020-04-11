require 'pry'
class Place < ApplicationRecord

  belongs_to :user
  has_and_belongs_to_many :users
  geocoded_by :address
  before_validation :geocode

  def address
    # binding.pry
    [street, city, state, country].compact.reject { |c| c.empty? }.join(', ')
  end

  def location
    [latitude, longitude]
  end

  def set_location(latitude:, longitude:)
    update(latitude: latitude, longitude: longitude)
  end
end
