require 'test_helper'

class TravelTicketsControllerTest < ActionController::TestCase
  setup do
    @travel_ticket = travel_tickets(:one)
    @user = users(:one)
    @player = players(:one)
    login_user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:travel_tickets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create travel_ticket" do
    assert_difference('TravelTicket.count') do
      post :create, travel_ticket: { player_id: @player.id, ticket_img: Rack::Test::UploadedFile.new(Rails.root.join("test/files/test.png")), travel_id: 1, name: TravelTicketTest, ticket_sum: 10}
    end

    assert_redirected_to travel_ticket_path(assigns(:travel_ticket))
  end

  test "should show travel_ticket" do
    get :show, id: @travel_ticket
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @travel_ticket
    assert_response :success
  end

  test "should update travel_ticket" do
    patch :update, id: @travel_ticket, travel_ticket: { player_id: @player.id, ticket_img: @travel_ticket.ticket_img, travel_id: @travel_ticket.travel_id }
    assert_response :success

    #assert_redirected_to travel_ticket_path(assigns(:travel_ticket))
  end

  test "should destroy travel_ticket" do
    assert_difference('TravelTicket.count', -1) do
      delete :destroy, id: @travel_ticket
    end

    assert_redirected_to travel_tickets_path
  end
end
