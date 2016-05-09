class AddReportName < ActiveRecord::Migration
  def change
    add_column :links, :reportname, :string
  end
end
