class AddResponse < ActiveRecord::Migration
  def change
		create_table :responses do |t|
			t.timestamps
			t.string :reply
			t.integer :user_id
			t.integer :answer_id
		end
  end
end
