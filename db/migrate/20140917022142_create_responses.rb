class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :campaign_id
      t.integer :target_id
      t.string :question
      t.string :answer
      t.timestamp :contacted_when

      t.timestamps
    end
  end
end
