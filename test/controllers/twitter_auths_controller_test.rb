require 'test_helper'

class TwitterAuthsControllerTest < ActionController::TestCase
  setup do
    @twitter_auth = twitter_auths(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:twitter_auths)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create twitter_auth" do
    assert_difference('TwitterAuth.count') do
      post :create, twitter_auth: {  }
    end

    assert_redirected_to twitter_auth_path(assigns(:twitter_auth))
  end

  test "should show twitter_auth" do
    get :show, id: @twitter_auth
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @twitter_auth
    assert_response :success
  end

  test "should update twitter_auth" do
    patch :update, id: @twitter_auth, twitter_auth: {  }
    assert_redirected_to twitter_auth_path(assigns(:twitter_auth))
  end

  test "should destroy twitter_auth" do
    assert_difference('TwitterAuth.count', -1) do
      delete :destroy, id: @twitter_auth
    end

    assert_redirected_to twitter_auths_path
  end
end
