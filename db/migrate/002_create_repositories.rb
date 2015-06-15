class CreateRepositories < ActiveRecord::Migration
  def up
    create_table :reposits do |t|
      t.string  :reposit_name
    end
  end

  def down
    drop_table :reposits
  end
end