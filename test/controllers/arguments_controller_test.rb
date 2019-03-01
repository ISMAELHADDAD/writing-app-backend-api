require "test_helper"

class ArgumentsControllerTest < ActionDispatch::IntegrationTest
  test "should get success show on create" do
    post discussion_arguments_url(discussion_id: 1),
      params: {
        user_id: 1,
        avatar_id: 1,
        content: 'It\'s a test argument'
      }

    json = JSON.parse(response.body)
    assert_equal json['content'], 'It\'s a test argument'
    assert_equal json['from_AvatarID'], 1

    assert_response :success
  end

  test "should get error message show on create with non-existing user" do
    post discussion_arguments_url(discussion_id: 1),
      params: {
        user_id: 100,
        avatar_id: 1,
        content: 'It\'s a test argument'
      }
    assert_match /Couldn't find User/, JSON.parse(response.body)['message']
    assert_response :not_found
  end

  test "should get error message show on create with non-existing avatar" do
    post discussion_arguments_url(discussion_id: 1),
      params: {
        user_id: 1,
        avatar_id: 100,
        content: 'It\'s a test argument'
      }
    assert_match /Couldn't find Avatar/, JSON.parse(response.body)['message']
    assert_response :not_found
  end
end