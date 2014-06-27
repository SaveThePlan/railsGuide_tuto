require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  test "should get index,new,create" do
    get :index,new,create
    assert_response :success
  end

end
