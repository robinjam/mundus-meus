require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = Post.create!(title: "Test", content: "This is a test", created_at: 5.minutes.ago)
    @post_two = Post.create!(title: "Test", content: "This is a test")
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
    assert_equal [@post_two, @post], assigns(:posts), "Posts should be sorted by date"
  end

  test "should get new" do
    as_admin { get :new }
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      as_admin { post :create, post: @post.attributes }
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should show post" do
    get :show, id: @post.to_param
    assert_response :success
  end

  test "should get edit" do
    as_admin { get :edit, id: @post.to_param }
    assert_response :success
  end

  test "should update post" do
    as_admin { put :update, id: @post.to_param, post: @post.attributes }
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      as_admin { delete :destroy, id: @post.to_param }
    end

    assert_redirected_to posts_path
  end
end
