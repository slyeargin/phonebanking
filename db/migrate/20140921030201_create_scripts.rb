class CreateScripts < ActiveRecord::Migration
  def change
    create_table :scripts do |t|
      t.integer :campaign_id
      t.text :copy

      t.timestamps
    end
  end
end
