class ComputerMove
  attr_reader :name, :move

  def initialize(bot_name)
    @name = bot_name
    @move = MoveRegulation.legit_moves.sample
  end
end