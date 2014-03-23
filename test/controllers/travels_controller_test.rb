require 'test_helper'

class TravelsControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @travel = travels(:one)
    @player = players(:one)
    @travelticket = travel_tickets(:one)
    login_user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:travels)
  end

  test "should get new" do
    get :new, players: { surname: "testsur", name: "testname", id: 1 }
    assert_response :success
  end

  test "should create travel" do
    assert_difference('Travel.count')do
      post :create, travel: { description: @travel.description, destination: @travel.destination, travel_costs: @travel.travel_costs, travel_date: @travel.travel_date, travel_distance: @travel.travel_distance }
    end

    assert_redirected_to travel_path(assigns(:travel))
  end

#  test "should create travel with travelticket" do
#    travel2 = travels(:two)
#    assert_difference('TravelTicket.count') do
#      post :create, travel: { description: travel2.description, destination: travel2.destination, travel_costs: travel2.travel_costs, travel_date: travel2.travel_date, travel_distance: travel2.travel_distance,
#          players: [ @player.id ],
#          travel_tickets: {ticket_img: Rack::Test::UploadedFile.new(Rails.root.join("test/files/test.png")), name: @travelticket.name, player_id: @player.id, ticket_sum: 10 }}
#    end
#
#    assert_redirected_to travel_path(assigns(:travel))
#  end

  test "should show travel" do
    get :show, id: @travel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @travel
    assert_response :success
  end

  test "should update travel" do
    patch :update, id: @travel, travel: { description: @travel.description, destination: @travel.destination, travel_costs: @travel.travel_costs, travel_date: @travel.travel_date, travel_distance: @travel.travel_distance }
    assert_redirected_to travel_path(assigns(:travel))
  end

  test "should destroy travel" do
    assert_difference('Travel.count', -1) do
      delete :destroy, id: @travel
    end

    assert_redirected_to travels_path
  end
end
