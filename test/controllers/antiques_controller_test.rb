require 'test_helper'

class AntiquesControllerTest < ActionController::TestCase
  setup do
    @antique = antiques(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:antiques)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create antique" do
    assert_difference('Antique.count') do
      post :create, antique: { description: @antique.description }
    end

    assert_redirected_to antique_path(assigns(:antique))
  end

  test "should show antique" do
    get :show, id: @antique
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @antique
    assert_response :success
  end

  test "should update antique" do
    patch :update, id: @antique, antique: { description: @antique.description }
    assert_redirected_to antique_path(assigns(:antique))
  end

  test "should destroy antique" do
    assert_difference('Antique.count', -1) do
      delete :destroy, id: @antique
    end

    assert_redirected_to antiques_path
  end
end
