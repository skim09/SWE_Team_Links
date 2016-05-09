class Upvoters < ActiveRecord::Migration
  def change
    add_column :links, :upvoters, :string
  end
end
