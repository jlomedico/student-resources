require 'test_helper'

class WidgetFormsControllerTest < ActionController::TestCase
  setup do
    @widget_form = widget_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:widget_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create widget_form" do
    assert_difference('WidgetForm.count') do
      post :create, widget_form: {  }
    end

    assert_redirected_to widget_form_path(assigns(:widget_form))
  end

  test "should show widget_form" do
    get :show, id: @widget_form
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @widget_form
    assert_response :success
  end

  test "should update widget_form" do
    patch :update, id: @widget_form, widget_form: {  }
    assert_redirected_to widget_form_path(assigns(:widget_form))
  end

  test "should destroy widget_form" do
    assert_difference('WidgetForm.count', -1) do
      delete :destroy, id: @widget_form
    end

    assert_redirected_to widget_forms_path
  end
end
