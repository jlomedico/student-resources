class Card
  attr_reader :suit, :value

  def initialize(value, suit)
    raise ArgumentError unless (1..13).to_a.include?(value.to_i) &&
    ['clubs', 'hearts', 'diamonds', 'spades'].include?(suit.to_s)

    @value, @suit = value.to_i, suit.to_s
  end

  def to_s
    "#{face} of #{suit.capitalize}"
  end

  def face
    case value
    when 1
      "Ace"
    when 11
      "Jack"
    when 12
      "Queen"
    when 13
      "King"
    else
      value
    end
  end
end
