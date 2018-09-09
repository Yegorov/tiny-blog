class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :subtitle
      t.string :slug, null: false
      t.references :author
      t.datetime :date
      t.text :content
      t.integer :reading_time_estimation
      t.boolean :enabled, default: true

      t.timestamps
    end

    add_foreign_key :posts, :users, column: :author_id

    add_index :posts, :title
    add_index :posts, :slug, unique: true

  end
end
