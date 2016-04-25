class AddEmail < ActiveRecord::Migration
  def change
    add_column :links, :email, :string
  end
end
