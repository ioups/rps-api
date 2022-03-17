module ResultCalculator
  def self.calculate(player, player_move, computer, computer_move)
    if player_move == computer_move
      { tie: true, winner: 'none' }
    elsif (player_move == 'rock' && computer_move == 'scissors') ||
          (player_move == 'paper' && computer_move == 'rock') ||
          (player_move == 'paper' && computer_move == 'rock')
      { tie: false, winner: player }
    else
      { tie: false, winner: computer }
    end
  end
end
