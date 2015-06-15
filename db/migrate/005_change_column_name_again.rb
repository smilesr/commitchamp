class ChangeColumnNameAgain < ActiveRecord::Migration
  def change
    rename_column :contributions, :repo_id, :reposit_id
  end
end 