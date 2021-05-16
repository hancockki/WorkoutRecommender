require "test_helper"

class WorkoutRecommenderControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get workout_recommender_index_url
    assert_response :success
  end
end
