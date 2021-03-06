require "test_helper"

class ArgumentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get discussion_arguments_url(discussion_id: 1)

    json = JSON.parse(response.body)
    assert_equal 4, json.size, "should get 4 arguments"

    assert_response :success
  end

  test "should get success show on create" do
    post discussion_arguments_url(discussion_id: 1),
      params: {
        avatar_id: 1,
        content: 'It\'s a test argument'
      },
      headers: { "Authorization" => "123456" }

    json = JSON.parse(response.body)
    assert_equal 'It\'s a test argument', json['content']
    assert_equal 1, json['fromAvatar']['id']

    assert_response :success
  end

  test "should get error message show on create with non-existing user" do
    post discussion_arguments_url(discussion_id: 1),
      params: {
        avatar_id: 1,
        content: 'It\'s a test argument'
      },
      headers: { "Authorization" => "111111" }

    assert_match /session_token expired or doesn't exists/, JSON.parse(response.body)['message']
    assert_response :unauthorized
  end

  test "should get error message show on create with non-existing avatar" do
    post discussion_arguments_url(discussion_id: 1),
      params: {
        avatar_id: 100,
        content: 'It\'s a test argument'
      },
      headers: { "Authorization" => "123456" }

    assert_match /Couldn't find Avatar/, JSON.parse(response.body)['message']
    assert_response :not_found
  end
end
