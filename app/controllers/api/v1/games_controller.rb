class Api::V1::GamesController < ApplicationController
  include ResultCalculator

  def play
    @player = game_params.fetch(:name)
    @player_move = game_params.fetch(:move)
    @computer = computer_action.name
    @computer_move = computer_action.move
    if check_move
      render json: resp_body
    else
      render json: {status: "error", code: 400, message: "Can't find this move ! pick rock paper or scissors !"}, :status => 400
    end
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

  def check_move
    MoveRegulation.legit_moves.include?(@player_move)
  end

  def game_params
    params.require(:game).permit(:name, :move)
  end
end

