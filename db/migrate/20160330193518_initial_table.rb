class InitialTable < ActiveRecord::Migration
  def change
    create_table :links do |t|
    	t.string :name
    	t.string :url
    	t.integer :upvotes, :default => 0
    	t.string :category
      t.timestamps
    end
  end
end
