require 'test_helper'

class PostTest < ActiveSupport::TestCase
  setup do 
    @posts_base = Post.find_posts("tech", nil, nil);   
  end

  test "fetch query returns Array object" do 
      assert_instance_of Array, @posts_base
  end

  test "fetch query returns objects with all parameters" do 
      param_count = @posts_base.first.count
      assert_equal 7, param_count
  end

  test "fetch query does not contain duplicates" do
      assert_equal @posts_base.count, @posts_base.uniq.count
  end

  test "fetch query returns set of all posts with specific tag" do
      assert @posts_base.all?{|post| post['tags'].include?('tech')}
  end

  test "fetch query with defined sort parameter returns numerically sorted posts" do 
      @posts_likes = Post.find_posts("tech", 'likes', nil);
      arr_of_likes = @posts_likes.map{|post| post['likes']}
      assert_equal arr_of_likes, arr_of_likes.sort
  end

  test "fetch query with defined direction parameter returns correctly sorted posts" do
      @posts_likes = Post.find_posts("tech", 'likes', nil);
      @posts_desc = Post.find_posts("tech", 'likes', 'desc');

      assert_equal @posts_likes.first, @posts_desc.last
  end
end
