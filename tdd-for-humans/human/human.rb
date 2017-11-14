class Human
  attr_reader :tummy, :state

  def initialize
    @tummy = 'hungry'
    @state = 'sleepy'
  end

  def eat_breakfast
    @tummy = 'full'
    @state = 'awake'
  end
end
