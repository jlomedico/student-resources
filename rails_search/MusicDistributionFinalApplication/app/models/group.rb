class Group < ActiveRecord::Base
  scope :search, ->(term) { where("name LIKE ? OR genre LIKE ?", wrap(term), wrap(term)) }

  private

  def self.wrap(term)
    "%#{term}%"
  end
end
