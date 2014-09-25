class AddInvitedtoToUser < ActiveRecord::Migration
  def change
    add_column :users, :invited_to_campaign, :integer
  end
end
