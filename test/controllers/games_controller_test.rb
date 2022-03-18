require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  test "should post play" do
    post api_v1_play_url, params: { "name": "Ponky", "move": "paper" }, as: :json
    assert_response :success
  end

  test "should check player bad move" do
    post api_v1_play_url, params: { "name": "Boby", "move": "pinguin" }, as: :json
    assert_response :bad_request
  end

  test "should return the correct player name" do
    post api_v1_play_url, params: { "name": "Ponky", "move": "paper" }, as: :json
    body = JSON.parse(response.body)
    assert_equal "Ponky", body["moves"][0]["name"]
  end

  test "should return the correct computer  name" do
    post api_v1_play_url, params: { "name": "Ponky", "move": "paper" }, as: :json
    body = JSON.parse(response.body)
    assert_equal "Bot", body["moves"][1]["name"]
  end

  test "should return a game result" do
    @computer_move = "scissors"
    post api_v1_play_url, params: { "name": "Ponky", "move": "paper" }, as: :json
    puts body = JSON.parse(response.body)
    assert_not_empty body["results"]["winner"]
  end


end
