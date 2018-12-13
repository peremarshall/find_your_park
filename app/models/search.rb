class Search < ApplicationRecord
  validates_presence_of :searchable_type, :criteria
  validates_uniqueness_of :criteria, scope: :searchable_type
end
