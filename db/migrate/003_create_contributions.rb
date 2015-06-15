class CreateContributions < ActiveRecord::Migration
  def up
    create_table :contributions do |t|
      t.integer :user_id
      t.integer :repo_id
      t.integer :additions
      t.integer :deletions
      t.integer :changes
    end
  end

  def down
    drop_table :contributions
  end
end