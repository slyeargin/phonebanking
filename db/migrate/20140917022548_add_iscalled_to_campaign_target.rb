class AddIscalledToCampaignTarget < ActiveRecord::Migration
  def change
    add_column :targets, :has_been_called, :boolean, default: false
  end
end
