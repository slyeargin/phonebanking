class AddAttributesToCampaignTargets < ActiveRecord::Migration
  def change
    add_column :targets, :address1, :string
    add_column :targets, :city, :string
    add_column :targets, :state, :string, :limit => 2
  end
end
