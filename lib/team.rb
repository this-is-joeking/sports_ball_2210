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
    long_term_roster = @roster.map do |player|
      player if player.contract_length > 24
    end
    long_term_roster.compact
  end

  def short_term_players
    short_term_roster = @roster.map do |player|
      player if player.contract_length <= 24
    end
    short_term_roster.compact
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

  def average_cost_of_player
    avg = total_value / player_count
    "$#{avg}"
    # need to add way to format number with commas
  end

  def players_by_last_name
    last_names = roster.map do |player|
      player.last_name
    end
    last_names.sort.join(", ")
  end
end
