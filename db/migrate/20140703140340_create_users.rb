class CreateUsers < ActiveRecord::Migration
	def change
		create_table :users do |t|
			t.string :name
			t.boolean :admin, default: false
			t.string :password_digest
			t.integer :happiness
			t.integer :nausea
			t.integer :tickets
			t.integer :height
		end
	end
end
