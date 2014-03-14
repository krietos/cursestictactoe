class Player
  attr_reader(:symbol)

  def initialize(symbol)
    @symbol = symbol
  end

  def Player.create(symbol)
    new_player = Player.new(symbol)
  end
end
