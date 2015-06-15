class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :contributions, :changes, :contribs
  end
end 
