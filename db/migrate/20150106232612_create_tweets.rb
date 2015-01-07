class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.references :author
      t.string :content
      t.timestamps
    end
  end
end
