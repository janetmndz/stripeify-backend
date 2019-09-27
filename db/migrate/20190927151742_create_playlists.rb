class CreatePlaylists < ActiveRecord::Migration[5.2]
  def change
    create_table :playlists do |t|
      t.belongs_to :user, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
