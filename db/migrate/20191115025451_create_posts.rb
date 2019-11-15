class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :author
      t.integer :authorId
      t.integer :likes
      t.float :popularity
      t.integer :reads
      t.string :tags

      t.timestamps
    end
  end
end
