class Celeb
  attr_accessor :name, :birthday, :gender

  def initialize name, birthday, gender
    @name = name
    @birthday = birthday
    @gender = gender
  end

  def age
    ((Time.now - @birthday) / 60 /60 / 24 /365).to_i
  end
end
