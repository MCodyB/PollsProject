class AddTeam < ActiveRecord::Migration
  def change
		create_table :teams do |t|
			t.timestamps
			t.integer :user_id
		end
  end
end
