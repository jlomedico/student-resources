class Artist < ActiveRecord::Base
  scope :search, ->(term) { where("name LIKE ?", "%#{term}%") }
end
