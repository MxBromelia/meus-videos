class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :url, null: false
      t.string :video_id, null: false
      t.string :title
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
