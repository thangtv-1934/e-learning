class CreateFollwers < ActiveRecord::Migration[5.2]
  def change
    create_table :follwers do |t|
      t.integer :follower_id
      t.integer :followed_id
      t.timestamps
    end
  end
end
