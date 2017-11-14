require './human.rb'

describe Human do
  context "before breakfast" do
    let(:human) do
      Human.new # given: a human, when: before breakfast
    end

    it 'is hungry' do
      expect(human.tummy).to eq('hungry') # then: it's hungry
    end

    it 'is sleepy' do
      expect(human.state).to eq('sleepy') # then: it's sleepy
    end
  end

  context 'after drinking coffee' do
    let(:human) do
      human = Human.new    # given: a human
      human.eat_breakfast  # when: after breakfast
      human
    end

    it "isn't sleepy" do
      expect(human.state).to eq('awake') # then: it's not sleepy
    end

    it "isn't hungry" do
      expect(human.tummy).to eq('full') # then: it's not hungry
    end
  end
end
