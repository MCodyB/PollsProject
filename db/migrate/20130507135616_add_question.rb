class AddQuestion < ActiveRecord::Migration
  def change
		create_table :questions do |t|
			t.timestamps
			t.string :body
			t.integer :poll_id
		end
	end
end
