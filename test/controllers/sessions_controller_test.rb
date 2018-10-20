require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  setup do
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: 'github',
      uid: '123545',
      info: {
        image: "www.picture.url/1",
        nickname: "test_user"
      },
      credentials: {
        token: "very_long_token_here"
      }
    })
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:github]
  end



    test "#create should successfully create a user" do
    post '/auth/github/callback'

    test_user = User.find(session[:user_id])

    assert_equal '123545', test_user.uid
    assert_equal 'test_user', test_user.username
    assert_equal 'www.picture.url/1', test_user.avatar_url
    assert_equal 'github', test_user.provider
    assert_equal 'very_long_token_here', test_user.oauth_token
    end

    test "#create should successfully create a session" do
      post '/auth/github/callback'
      assert_not_nil session[:user_id]
    end

    test "#create should redirect the user to the root url" do
      post '/auth/github/callback'
      assert_redirected_to root_url
    end

    test "#delete should clear the session" do
      post '/auth/github/callback'
      assert_not_nil session[:user_id]
      delete '/signout'
      assert_nil session[:user_id]
    end

    test "#delete should redirect to the home page" do
      post '/auth/github/callback'
      delete '/signout'
      assert_redirected_to root_url
    end

end
