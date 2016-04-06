class AddingComments < ActiveRecord::Migration
  def change
    add_column :links, :comments, :string
  end
end
