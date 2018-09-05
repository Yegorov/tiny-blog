class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :title, null: false
      t.string :subtitle
      t.string :slug, null: false
      t.references :author
      t.text :content
      t.boolean :enabled, default: true

      t.timestamps
    end

    add_foreign_key :pages, :users, column: :author_id

    add_index :pages, :title
    add_index :pages, :slug, unique: true
  end
end
