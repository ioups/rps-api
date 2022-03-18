require "test_helper"

class ResultCalculatorTest < ActionDispatch::IntegrationTest

  rock_vs_scissors = ResultCalculator.calculate("player", "rock", "Bot", "scissors")

  test "should return a Hash" do
    assert_instance_of Hash, rock_vs_scissors
  end

  test "rock beats scissors" do
    assert_equal "player", rock_vs_scissors[:winner]
    assert_not rock_vs_scissors[:tie]
  end

  rock_vs_rock = ResultCalculator.calculate("player", "rock", "Bot", "rock")
  test "Should be a tie and no winner" do
    assert_equal "none", rock_vs_rock[:winner]
    assert rock_vs_rock[:tie]
  end

  rock_vs_paper = ResultCalculator.calculate("player", "rock", "Bot", "paper")
  test "paper beats rock" do
    assert_equal "Bot", rock_vs_paper[:winner]
    assert_not rock_vs_paper[:tie]
  end
  paper_vs_scissors = ResultCalculator.calculate("player", "paper", "Bot", "scissors")
  test "scissors beats paper" do
    assert_equal "Bot", paper_vs_scissors[:winner]
    assert_not paper_vs_scissors[:tie]
  end
end