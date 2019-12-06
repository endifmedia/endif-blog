class AddStaffToJob < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :staff, :string
  end
end
