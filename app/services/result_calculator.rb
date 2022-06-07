module ResultCalculator
  def self.calculate(player, player_move, computer, computer_move)
    if player_move == computer_move
      { tie: true, winner: 'none' }
    elsif (player_move == 'rock' &&  ['scissors','lizard'].include?(computer_move)) ||
          (player_move == 'paper' && ['rock','spock'].include?(computer_move)) ||
          (player_move == 'scissors' && ['paper','lizard'].include?(computer_move)) ||
          (player_move == 'lizard' && ['paper','spock'].include?(computer_move)) ||
          (player_move == 'spock' && ['rock','scissors'].include?(computer_move))
      { tie: false, winner: player }
    else
      { tie: false, winner: computer }
    end
  end
end
# lizard + spock moves
# check the ash
#