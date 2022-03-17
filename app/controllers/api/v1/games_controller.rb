#require_relative "#{Rails.root}/lib/computer_move"
# require_relative "#{Rails.root}/lib/result_calculator"

class Api::V1::GamesController < ApplicationController
  include ResultCalculator



  def test
  end
  def play
    @player = game_params.fetch(:name)
    @player_move = game_params.fetch(:move)
    @computer = computer_action.name
    @computer_move = computer_action.move
    render json: resp_body
  end

  private
  def resp_body
    {
      moves: [
        {
          name: @player,
          move: @player_move
        },
        {
          name: @computer,
          move: @computer_move
        }
      ],
      results: {
        tie: calculation[:tie],
        winner: calculation[:winner]
        }
    }
  end
  def calculation
    ResultCalculator.calculate(@player, @player_move, @computer, @computer_move)
  end


  def computer_action
    ComputerMove.new("Bot")
  end

  def game_params
    params.require(:game).permit(:name, :move)
  end
end

