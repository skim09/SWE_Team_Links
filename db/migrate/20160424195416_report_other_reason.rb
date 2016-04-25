class ReportOtherReason < ActiveRecord::Migration
  def change
    add_column :links, :reportreason, :string
    add_column :links, :otherreportreason, :string
  end
end
