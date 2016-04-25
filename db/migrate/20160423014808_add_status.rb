class AddStatus < ActiveRecord::Migration
  def change
    add_column :links, :status, :boolean
  end
end
