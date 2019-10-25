class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :artist
      t.string :title
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
