class CreateCallers < ActiveRecord::Migration
  def change
    create_table :callers do |t|
      t.integer :user_id
      t.integer :campaign_id
      t.boolean :is_campaign_owner, default: false

      t.timestamps
    end
  end
end
