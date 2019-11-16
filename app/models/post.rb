require 'open-uri'
require 'json'

class Post < ApplicationRecord

    def self.fetch_post_data(query)
        url = "https://DOMAIN.COM/blog/posts?tag=#{query}"
        response = open(url).read
        JSON.parse(response)
    end

    def self.find_posts(tags, sort_field, direction)
        sort_field ||= "id"
        direction ||= "asc"
        tags_arr = tags.split(',')
        merged = []

        tags_arr.each do |tag|
            post_data = fetch_post_data(tag)
            posts = post_data["posts"]
            merged = merged | posts
        end

        merged.sort_by! {|post| post[sort_field]}
        direction == "asc" ? merged : merged.reverse!
    end
    
end
