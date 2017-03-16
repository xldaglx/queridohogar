require 'test_helper'

class AdditionalsControllerTest < ActionController::TestCase
  setup do
    @additional = additionals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:additionals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create additional" do
    assert_difference('Additional.count') do
      post :create, additional: { category: @additional.category, description: @additional.description, image: @additional.image }
    end

    assert_redirected_to additional_path(assigns(:additional))
  end

  test "should show additional" do
    get :show, id: @additional
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @additional
    assert_response :success
  end

  test "should update additional" do
    patch :update, id: @additional, additional: { category: @additional.category, description: @additional.description, image: @additional.image }
    assert_redirected_to additional_path(assigns(:additional))
  end

  test "should destroy additional" do
    assert_difference('Additional.count', -1) do
      delete :destroy, id: @additional
    end

    assert_redirected_to additionals_path
  end
end
