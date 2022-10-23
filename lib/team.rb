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

  def long_term_players
    # should come back and consider other enumerables if time permits
    long_term_roster = []
    @roster.each do |player|
      long_term_roster << player if player.contract_length > 24
    end
    long_term_roster
  end

  def short_term_players
    # should come back and consider other enumerables if time permits
    short_term_roster = []
    @roster.each do |player|
      short_term_roster << player if player.contract_length <= 24
    end
    short_term_roster
  end

  def total_value
    total = 0
    @roster.each do |player|
      total += player.total_cost
    end
    total
  end

  def details
    detail = Hash.new
    detail["total_value"] = total_value
    detail["player_count"] = player_count
    detail
  end
end
