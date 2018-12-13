class Park < ApplicationRecord
  validates_presence_of :name, :description
  reverse_geocoded_by :latitude, :longitude
end
