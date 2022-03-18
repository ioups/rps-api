require "test_helper"

class MoveRegulationTest < ActionDispatch::IntegrationTest
  test "should return an array" do
    array = MoveRegulation.legit_moves
    assert_instance_of Array, array
  end
  test "should include 3 moves" do
    array = MoveRegulation.legit_moves
    assert_equal 3, array.size
  end
  test "should include 3 legit moves" do
    moves = ['rock', 'paper', 'scissors']
    MoveRegulation.legit_moves.each do |move|
      assert_includes moves, move
    end
  end
end