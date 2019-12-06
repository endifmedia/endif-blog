class AddMarketingPitchToJob < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :marketing_blurb, :string
  end
end
