require 'player'

describe Player do
  subject(:pikachu) {Player.new('Pikachu')}
  subject(:snorlax) {Player.new('Snorlax')}

  it "can return it's name" do
    player = Player.new("Pikachu") 
    expect(player.name).to eq "Pikachu"
  end

  describe '#hit_points' do
    it 'returns the hit points' do
      expect(pikachu.hit_points).to eq described_class::DEFAULT_HIT_POINTS
    end
  end

  describe '#attack' do
    it 'damages the player' do
      expect(snorlax).to receive(:receive_damage)
      pikachu.attack(snorlax)
    end
  end

  describe '#receive_damage' do
    it 'reduces the player hit points' do
      expect { pikachu.receive_damage }.to change {pikachu.hit_points}
    end
  end
end