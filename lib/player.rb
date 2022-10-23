class Player
  attr_reader :monthly_cost,
              :contract_length

  def initialize(fullname, monthly_cost, contract_length)
    @fullname = fullname
    @monthly_cost = monthly_cost
    @contract_length = contract_length

  end

  def first_name
    @fullname.split[0]
  end

  def last_name
    @fullname.split[1]
  end

  def total_cost
    @monthly_cost * @contract_length
  end
end
