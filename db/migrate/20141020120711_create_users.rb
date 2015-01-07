class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :password_digest
      t.string :blurb
      t.string :city
      t.string :pic_url
      t.timestamps
    end
  end
end
