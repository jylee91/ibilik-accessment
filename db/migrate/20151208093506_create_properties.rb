class CreateProperties < ActiveRecord::Migration
	def change
		create_table :properties do |t|
			t.string :property_description
			t.string :rental
			t.integer :user_id

			t.timestamps null: false 
		end
	end
end
