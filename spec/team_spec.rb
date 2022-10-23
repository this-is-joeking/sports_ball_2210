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

  describe '#long_term_players' do
    it 'returns an array of players with contracts greater than 2 years' do
      team = Team.new("Diamondbacks", "Arizona")
      player_1 = Player.new("Michael Palledorous" , 1000000, 36)
      player_2 = Player.new("Kenny DeNunez", 500000, 24)
      player_3 = Player.new("Alan McClennan", 750000, 48)
      player_4 = Player.new("Hamilton Porter", 100000, 12)

      team.add_player(player_1)
      team.add_player(player_2)
      team.add_player(player_3)
      team.add_player(player_4)

      expect(team.long_term_players).to eq [player_1, player_3]
      team.add_player(player_3)
      expect(team.long_term_players).to eq [player_1, player_3, player_3]
    end
  end

  describe '#short_term_players' do
    it 'returns an array of players with contracts greater than 2 years' do
      team = Team.new("Diamondbacks", "Arizona")
      player_1 = Player.new("Michael Palledorous" , 1000000, 36)
      player_2 = Player.new("Kenny DeNunez", 500000, 24)
      player_3 = Player.new("Alan McClennan", 750000, 48)
      player_4 = Player.new("Hamilton Porter", 100000, 12)

      team.add_player(player_1)
      team.add_player(player_2)
      team.add_player(player_3)
      team.add_player(player_4)

      expect(team.short_term_players).to eq [player_2, player_4]
      team.add_player(player_2)
      expect(team.short_term_players).to eq [player_2, player_4, player_2]
    end
  end

  describe '#total_value' do
    it 'calculates total cost of all players contracts' do
      team = Team.new("Diamondbacks", "Arizona")
      player_1 = Player.new("Michael Palledorous" , 1000000, 36)
      player_2 = Player.new("Kenny DeNunez", 500000, 24)
      player_3 = Player.new("Alan McClennan", 750000, 48)
      player_4 = Player.new("Hamilton Porter", 100000, 12)

      team.add_player(player_1)
      team.add_player(player_2)

      expect(team.total_value).to eq 48000000

      team.add_player(player_3)
      team.add_player(player_4)

      expect(team.total_value).to eq 85200000
    end
  end

  describe '#details' do
    it 'returns a hash with total value and player count as keys' do
      team = Team.new("Diamondbacks", "Arizona")
      player_1 = Player.new("Michael Palledorous" , 1000000, 36)
      player_2 = Player.new("Kenny DeNunez", 500000, 24)
      player_3 = Player.new("Alan McClennan", 750000, 48)
      player_4 = Player.new("Hamilton Porter", 100000, 12)

      team.add_player(player_1)
      team.add_player(player_2)
      team.add_player(player_3)
      team.add_player(player_4)

      expect(team.details["total_value"]).to eq 85200000
      expect(team.details["player_count"]).to eq 4
    end
  end

  describe '#average_cost_of_player' do
    it 'calculates the average average_cost_of_player' do
      team = Team.new("Diamondbacks", "Arizona")
      player_1 = Player.new("Michael Palledorous" , 1000000, 36)
      player_2 = Player.new("Kenny DeNunez", 500000, 24)
      player_3 = Player.new("Alan McClennan", 750000, 48)
      player_4 = Player.new("Hamilton Porter", 100000, 12)

      team.add_player(player_1)
      team.add_player(player_2)
      team.add_player(player_3)
      team.add_player(player_4)

      expect(team.average_cost_of_player).to eq "$21,300,000"
    end
  end

  describe '#players_by_last_name' do
    it 'provides a string of alphabetized player last names' do
      team = Team.new("Diamondbacks", "Arizona")
      player_1 = Player.new("Michael Palledorous" , 1000000, 36)
      player_2 = Player.new("Kenny DeNunez", 500000, 24)
      player_3 = Player.new("Alan McClennan", 750000, 48)
      player_4 = Player.new("Hamilton Porter", 100000, 12)

      team.add_player(player_1)
      team.add_player(player_2)
      team.add_player(player_3)
      team.add_player(player_4)

      expect(team.players_by_last_name).to eq "DeNunez, McClennan, Palledorous, Porter"
    end
  end
end
