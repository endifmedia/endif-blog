class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :company
      t.string :remoteness
      t.string :website

      t.references :user, foreign_key: true
    end
  end
end
