require 'rspec'
require './lib/player'
require './lib/team'

RSpec.describe Team do
  it 'exists' do
    team = Team.new("Diamondbacks", "Arizona")

    expect(team).to be_a Team
  end

  it 'starts with an empty roster' do
    team = Team.new("Diamondbacks", "Arizona")

    expect(team.roster).to eq []
  end

  describe '#player_count' do
    it 'starts with 0 players' do
      team = Team.new("Diamondbacks", "Arizona")

      expect(team.player_count).to eq 0
    end
  end

  describe '#add_player' do
    it 'can add players to the team' do
      team = Team.new("Diamondbacks", "Arizona")
      player_1 = Player.new("Michael Palledorous" , 1000000, 36)
      player_2 = Player.new("Kenny DeNunez", 500000, 24)

      team.add_player(player_1)
      team.add_player(player_2)

      expect(team.player_count).to eq 2
    end
  end

end
