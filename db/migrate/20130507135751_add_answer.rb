class AddAnswer < ActiveRecord::Migration
  def change
		create_table :answers do |t|
			t.timestamps
			t.string :body
			t.integer :question_id
			t.integer :user_id
		end
	end
end
