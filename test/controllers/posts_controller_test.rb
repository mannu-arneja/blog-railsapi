require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest

    test "should return successfully with required tags query and no optional parameters" do
        get "/api/posts/?tags=tech"
        assert_response :success
    end

    test "should error 200 on api call without query" do 
        get api_posts_path
        assert_response :bad_request
    end 

    test "should error 200 on api call with invalid sort field" do
        get "/api/posts/?tags=tech&sortBy=nothing"
        assert_response :bad_request
    end

    test "should error 200 on api call with invalid direction field" do
        get "/api/posts/?tags=tech&direction=nowhere"
        assert_response :bad_request
    end
    
end