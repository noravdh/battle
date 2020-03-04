require 'player'

describe Player do
  it "can return it's name" do
    player = Player.new("Pikachu") 
    expect(player.name).to eq "Pikachu"
  end
end