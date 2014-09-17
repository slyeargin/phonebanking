class CreateTargets < ActiveRecord::Migration
  def change
    create_table :targets do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :zipcode
      t.integer :campaign_id

      t.timestamps
    end
  end
end
