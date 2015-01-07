class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.integer :from_user_id
      t.integer :to_user_id
    end
  end
end
