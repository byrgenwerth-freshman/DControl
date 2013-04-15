require 'test_helper'

class FlowsControllerTest < ActionController::TestCase
=begin
  setup do
    @flow = flows(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flow" do
    assert_difference('Flow.count') do
      post :create, flow: { byte: @flow.byte, destination_dns: @flow.destination_dns, destination_ip: @flow.destination_ip, destination_port: @flow.destination_port, duration: @flow.duration, flows: @flow.flows, gathered: @flow.gathered, id: @flow.id, packets: @flow.packets, protocol: @flow.protocol, rank: @flow.rank, source_dns: @flow.source_dns, source_ip: @flow.source_ip, source_port: @flow.source_port }
    end

    assert_redirected_to flow_path(assigns(:flow))
  end

  test "should show flow" do
    get :show, id: @flow
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @flow
    assert_response :success
  end

  test "should update flow" do
    put :update, id: @flow, flow: { byte: @flow.byte, destination_dns: @flow.destination_dns, destination_ip: @flow.destination_ip, destination_port: @flow.destination_port, duration: @flow.duration, flows: @flow.flows, gathered: @flow.gathered, id: @flow.id, packets: @flow.packets, protocol: @flow.protocol, rank: @flow.rank, source_dns: @flow.source_dns, source_ip: @flow.source_ip, source_port: @flow.source_port }
    assert_redirected_to flow_path(assigns(:flow))
  end

  test "should destroy flow" do
    assert_difference('Flow.count', -1) do
      delete :destroy, id: @flow
    end

    assert_redirected_to flows_path
  end
=end
end
