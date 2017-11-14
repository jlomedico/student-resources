class Babysitter < ActiveRecord::Base
  has_many :reviews
  validates :sat_score, presence: { message: "You need to enter your SAT score!" }



  def avg_rating
    self.reviews.average(:rating).to_f
  end
end
