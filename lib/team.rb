class Team
  attr_reader :roster

  def initialize(team_name, location)
    @team_name = team_name
    @location = location
    @roster = []
  end

  def player_count
    @roster.length
  end

  def add_player(player)
    @roster << player
  end
end
