json.posts do
    json.array!(@posts) do |post|
        json.extract! post, 'id', 'author', 'authorId', 'likes', 'popularity', 'reads', 'tags'
    end
end