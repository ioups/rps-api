require "test_helper"

class ComputerMoveTest < ActionDispatch::IntegrationTest
  test "should initiate with a Bot name" do
    comp = ComputerMove.new("Bot")
    assert_equal "Bot", comp.name
  end
  test "should pick a legit move" do
    comp = ComputerMove.new("bot")
    assert_includes MoveRegulation.legit_moves, comp.move
  end

end