require 'test_helper'

class StackImagesControllerTest < ActionController::TestCase
  setup do
    @stack_image = stack_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stack_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stack_image" do
    assert_difference('StackImage.count') do
      post :create, stack_image: { name: @stack_image.name, stack_id: @stack_image.stack_id, url: @stack_image.url }
    end

    assert_redirected_to stack_image_path(assigns(:stack_image))
  end

  test "should show stack_image" do
    get :show, id: @stack_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stack_image
    assert_response :success
  end

  test "should update stack_image" do
    put :update, id: @stack_image, stack_image: { name: @stack_image.name, stack_id: @stack_image.stack_id, url: @stack_image.url }
    assert_redirected_to stack_image_path(assigns(:stack_image))
  end

  test "should destroy stack_image" do
    assert_difference('StackImage.count', -1) do
      delete :destroy, id: @stack_image
    end

    assert_redirected_to stack_images_path
  end
end
