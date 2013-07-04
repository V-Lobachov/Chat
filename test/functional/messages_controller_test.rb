require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @message = messages(:one)
  end

  test "should get index" do
    get :index, :user_id => @user
    assert_response :success
    assert_not_nil assigns(:messages)
  end

  test "should get new" do
    get :new, :user_id => @user
    assert_response :success
  end

  test "should create message" do
    assert_difference('Message.count') do
      post :create, :user_id => @user, :message => @message.attributes
    end

    assert_redirected_to user_message_path(@user, assigns(:message))
  end

  test "should show message" do
    get :show, :user_id => @user, :id => @message.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :user_id => @user, :id => @message.to_param
    assert_response :success
  end

  test "should update message" do
    put :update, :user_id => @user, :id => @message.to_param, :message => @message.attributes
    assert_redirected_to user_message_path(@user, assigns(:message))
  end

  test "should destroy message" do
    assert_difference('Message.count', -1) do
      delete :destroy, :user_id => @user, :id => @message.to_param
    end

    assert_redirected_to user_messages_path(@user)
  end
end
