class ComputerMove
  attr_reader :name, :move
  MOVES = %w(rock paper scissors)

  def initialize(bot_name)
    @name = bot_name
    @move = MOVES.sample
  end
end