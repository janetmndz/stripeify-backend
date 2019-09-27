class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :playlist, foreign_key: true
      t.boolean :upvote, null: false, default: false
      t.timestamps
    end
  end
end
