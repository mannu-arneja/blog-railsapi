require 'test_helper'

class RoutesTest < ActionDispatch::IntegrationTest
  test "route test" do
    assert_generates api_ping_path, :controller => "api/posts", :action => "ping"
    assert_generates api_posts_path, :controller => "api/posts", :action => "index"
  end
end